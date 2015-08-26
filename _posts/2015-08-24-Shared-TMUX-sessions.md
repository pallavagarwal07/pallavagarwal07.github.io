---
title: "Shared SSH sessions with TMUX - Best of terminal"
layout: default
img: ssh-arch.png
img-alt: Arch SSH screenshot
tags: post
---

Since the title isn't very descriptive, let us look at what we
are trying to achieve. Click the image below to view the animation
I recorded. The two terminals are made to mirror each other, i.e.
anything I type on one terminal will appear on the second one,
and vice versa.

<br />
<img src="/img/TMUX-animation.gif" alt="SSH shared session using TMUX" class="img-responsive">
<br />

This won't make much sense, or seem of any use, until you realize that
the two terminals need not be on the same computer. That is, me and
my friend from across the country could do this and it'd still work.

This has amazing applications. I have found it useful in teaching basic
stuff to others, like programming, or how to use a terminal. There are a
lot of high-end softwares like TeamViewer that do this for graphical
environments. But it's good to know that something like this can be achieved
tremendously easily on terminal.

<br />
<br />

__So, how do I do it?__

First of all, both machines need to SSH to a common server. If you don't have
access to a common server, then you need to set up OpenSSH on one of the two
computers and have the other person SSH into your computer.

Since I am at IIT Kanpur, I will use one of the computers in our Lab as the
common server.

```
ssh username@ccpc121.cc.iitk.ac.in
```

Now on one of the PC, run TMUX (`tmux`). For this to work, you must have
tmux installed. Install it using the usual package manager if you have
root access or use [Linuxbrew](/2015/06/26/Linuxbrew/) to install it
if you don't. Now from the other computer, run `tmux attach`.

This should attach the second terminal to the same TMUX session. 

ENJOY!

<br /><br />

_If you liked this article, please comment below, or share with others._
