---
title: "Learning from mistakes: Bugzilla Landfills"
layout: default
tags: gsoc
---

This post is regarding a recent incident that happened when I was working for
my project in Google Summer of Code.

My day's task was to automate the filing of a bug in bugzilla if and when a
build fails. Though, not too hard, it would obviously require testing, because
I can't just assume that my code would work the way it is supposed to.

This didn't seem like much of a problem at that time. What I decided to do was,
test on a single bug and delete it when I'm done. Simple Enough?

As it turns out, it wasn't so simple. And I would've known that, had I done a
bit of a research. You see, once a bug is reported, it can be edited, yet
closing, or deleting the bug is something only the administrators are capable
of. So, by creating a bug in bugzilla I inadvertantly sent an email about a
bug to numerous people. 

<i>Thanks for reading</i>
<br /><br />
