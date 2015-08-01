---
title: "Using SSH from Windows 10 without PuTTY"
layout: default
tags: tip
---

With the recent upgrade to Windows 10, Microsoft fixed many of
the things that I despised in Windows 8.
I don't usually use Windows if I can avoid it, but unfortunately,
some of my work requires me to use it anyway. For those times,
one of the basic needs for me is an SSH client. A _LOT_ of the time
I'm programming directly on a SSHed server machine.

Till a few days ago, this meant that I had to use PuTTY everytime
I had to use SSH from Windows. If you have ever used PuTTY, you'd know
that it isn't pretty. It doesn't properly support xterm escape
sequences, it can't be easily resized and thus programs like vim
look absolute crap.

With the windowed Metro apps in Windows 10, I finally decided
to give a Metro App a chance as a SSH client.
[Here](https://www.microsoft.com/en-us/store/apps/remote-terminal/9wzdncrdn8b3)
is the app that I used.

<br />

####__RESULT?__

Amazing! Not only does it support xterm color escape sequences,
when running in full screen mode, it is indistinguishable from
a linux terminal (After SSHing obviously).

<br />

<img src="/img/ssh.jpg" alt="SSH from inside Windows 10" class="img-responsive">

_Yes, this is windows SSHed into a linux machine._
