---
title: "YourHonour: A k8s based distributed programming judge"
layout: default
img: yourhonourlogo.png
img-alt: YourHonour Banner
tags: post
---
So, this is something I have been working on recently for some time. The
project's name is YourHonour, and is is a Kubernetes(k8s) based Online Judge for
organising programming competitions.

**YourHonour** came into being because the Open Source solutions already present
either do not fit all the criteria, or are just too hard to setup. The ones
that are easy to set up, as well as provide complete functionality are either
paid, or non-free.

Anyway, I decided to build my own judge. Hell, how hard can it be? As it turns
out, creating a judge isn't as easy as I initially thought. There are way too
many things that can go wrong at any given time, most of the problems stemming
from the fact that the judge is supposed to run arbitrary code from the user on
the server, and make sure that it can't do anything malicious.

Lastly, the judge should properly utilize resources from the cluster or machine
on which it is running, and properly give the resources to each program. It should
schedule the tasks properly, and kill them after a desired time. When listed, these
look something like this:

1. Run Isolated code
2. No internet access to executable
3. Kill after desired time
4. Possibility to schedule on a cluster of computers/VMs
5. Limit resources, distribute resources
6. Handle exit status/signal of the user's code
7. Preventing malicious behaviour

**Let's tackle these one by one:**

### **Run isolated code**

The first thing that comes to mind when talking about isolation is a container.
That's pretty much it. That is probably the most sensible way to do it. In my
implementation, **I use docker containers to run the user's code**. This way,
the container is isolated, and the code inside can't get access to any of my
files.

### **Kill after desired time**

Killing a process after desired time is important in a process because we need
to catch any kind of TimeLimit errors too. To do this, we need to keep a track
of the running process somehow. Usual way to do this is to have the process as
a child of our own process. Then the parent would be able to wait on the child
as well as kill it if need be. We will later see that just killing the spawned
process may not be enough.

### **Scheduling on cluster**

Since I went with docker to isolate the codes, the obvious choice for container
orchestration was the brilliant Kubernetes. The only problem - terrible
documentation. Half of their links in the docs keep breaking. But that is not
my concern. Usually a google search can be used to find non-404 pages.
Kubernetes can be used to schedule the containers with both memory and CPU
limits, as well as is pretty easy to setup (especially the docker-multinode
method).

### ** Limit and distribute resources**

Kubernetes provides configuration for this, and thus isn't a concern.

### **Exit/Signal status of child**

As mentioned before, if the process is run as a child of our process, the
parent can listen to the events of the child, and find out any data needed
about the child.  This is implemented by having the parent call the fork call,
rewrite the stdout and stdin file descriptors, change user permissions and
execv the child process. Then the parent calls wait on the child, with a wakeup
alarm signal registered on the kernel.

### **Restrict internet access in container**

I didn't find a very elegant solution to this. The containers which run without
`--privileged` flag, **don't have any way to turn off internet access from
inside the container**. And the internet can't be turned off before the
continer is launched because the container uses the network to fetch the
input/output files from local machines on cluster.

On the other hand, adding the `--privileged` flag gives the container access to
my devices, including my hard drive, which a malicious code could use to
potentially mount and gain access to my system. What I ended up doing was a
compromise between the two. I run the docker with `--privileged` flag, but
before the executable is called, the `wrapper` (or the "parent") sets its UID
to an unprivileged user. Before doing so, the parent turns off the internet in
the container. Hope is that there is no way for the unprivileged user to turn
its internet connection back on (most probably true), however I still feel
uncomfortable using the `--privileged` flag.

### **Prevent malicious behaviour**

This one is probably the most involved since we don't know what is meant by
*malicious*. We have already stopped it from accessing internet, and our files,
drives and devices are safe. We have also tried our best to stop it from using
too many resources by limit container resources. So now what?

Unfortunately, it is not easy to see what is missing. So I had some seniors in
security look over the program and test it for vulnerabilities. They found two
major problems (till now):

1. **DoS attacks crush the server very easily:**

   Apparently nodejs server doesn't have protection against DoS attacks.
   *__Sigh__*. I didn't want to add a proxy gateway just to filter out DoS
   attacks, so for now I have patched the server with a temporary solution. If
   the server detects multiple consecutive requests (too many), it adds an
   iptable rule to drop connections from that IP. This isn't perfect, but it
   works. The server recovers from the attack in a few seconds, and the source
   is blocked from making any requests for some time (configurable).

2. **Fork bombs in source code:**

   Even though the resources for the container are limited, a fork bomb increases
   the number of processes a lot faster than the used up memory. This completely
   clutters up the ready queue and prevents the parent from being scheduled. In
   worst cases (and the behaviour is unpredictable), the docker container ends up
   crashing the host node (i.e.  computer or VM) as well. While the ideal solution
   would be to restrict the number of allowed processes, but I couldn't find the
   correct way to do this in docker.  As an alternative, **I increase the child's
   niceness value** making it less important than the parent in the scheduling
   algorithm. The **parent sends the kill signal to ALL processes it is allowed to
   send to**, and hence kills all descendants of the malicious process as well.
   This seems to work well, and I haven't had much problem since.

<br /><br />
