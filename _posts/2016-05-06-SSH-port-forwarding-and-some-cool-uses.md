---
title: "SSH port forwarding and some cool uses"
layout: default
img: secure.jpg
img-alt: Encrypted SSH
tags: post
---
I'll begin with some of the bare minimum and absolutely amazing things ssh port
forwarding is capable of, and see if I can convert this to a proper blog post
later.

<br/>

#### **1. Local port forwarding**

Syntax:

```
ssh -L8081:example.com:80 pallav@myserver.com
```

Meaning: Opens a SSH connection to myserver.com, and forward all requests to **my** port 8081
to port 80 (default http port) of example.com *via* myserver. Thus, if example.com is blocked
on my PC, but it can be accessed by some other PC which I have ssh access to, then I can use
this command to gain access to the blocked website (The website is now accessible on 
localhost:8081 in my browser). Also, ssh connections are encrypted, so the only thing ISP sees
is an open connection to myserver, and not the website I'm trying to access.
Unfortunately, many websites you see day to day check the hostname of request (which
would be localhost) and won't work this way. However, this trick is great to forward
SSH connections over multiple hops. (For bypassing website restrictions, read on)


Apart from this, you can forward any arbitrary port data to any arbitrary port, from
this point, only thing stopping you is your imagination.

<br/>

#### **2. Remote port forwarding**

Syntax:

```
ssh -R8081:example.com:22 pallav@myserver.com
```

This is extremely similar to local port forwarding, which is why it causes a lot of
people confusion. In previous case, the port being mapped was on local machine and the
request was being sent to example.com via remote server. In this case, the port being
mapped is on the remote server, while the request being sent is from local computer.
Get the difference? Good.

This is typically used if the local computer doesn't have a public IP address, and you
need access to it from outside. In that case, something like

```
ssh -R8081:localhost:22 pallav@myserver.com
```

Would give ssh access to (previously publically unaccessible) local PC via port 8081 of
remote server.

#### **3. Dynamic port forwarding**

Syntax:

```
ssh -D8081 pallav@myserver.com
```

In local port forwarding, we were restricted to forwarding request to a particular port
of example.com. But what if we want the requests to reach different destinations, on
different ports? By the above command, the port 8081 on localhost is dynamically mapped
such that, localhost:8081 can be used as a socks proxy for any request. Thus, this means
you can use remote server as a free VPN, by using the above command, and then setting
localhost:8081 as the socks proxy in the browser (leave other fields empty).


### **Quiz time**
Let's say you are in a hotel that has free wifi. But like every hotel, once you connect
to the wifi, it redirects you to the login page, which only allows one login per room
☹. But you are a hacker, and decide to share the connection with you brother, who also
has a laptop. What do you do?


<div class="spoiler">Turn on sshd service on one laptop (whichever one logins to internet)
Use the other laptop to ssh into this one using local ip address (shown in ifconfig)
. While SSHing, set up dynamic port forwarding. Now internet is accessible via
socks proxy through the tunnel.</div>

<br /><br />
