---
title: "Wrath of Linux Package Managers"
layout: default
tags: tip
---

We all love to characterise things as _"More than the sum of it's parts"_.
We'd like to say the same about our linux operating system. My __ARCH__ is more
than the sum of it's parts! Well.. no.

A linux system is exactly the sum of it's parts. And most of those parts
are connected to the base package manager, the beast that acts like a framework,
holding everything together.

Have you ever wondered what makes _Ubuntu_ __Ubuntu__?
Or what is the difference between _ARCH_ and _GENTOO_? If you guessed _a package
manager_, you'd be right.

You probably don't believe me? I mean, doesn't Ubuntu look completely
different from Linux Mint or Fedora? Sure it does, but that's only the defaults.
I have a Linux Mint and an Arch system which look identical, but have very
different package managers, and hence very different folder structures. And before
I shifted to i3wm (Window Manager), my ARCH used to look identical to the
environment you'd get on Fedora.

So, what makes these Package Managers so different from one another?
To answer that, let's look at some common package managers.

1. __DPKG__: If you have used any debian based OS, you should be familiar with
dpkg. Dpkg is known to create and install .deb packages. These packages contain
cross compiled binaries, with a predetermined folder structure. Files are merely
copied to the correct location during installation. All packages present upstream
are stable, and usually a little old.

2. __PORTAGE__: You probably haven't heard of this, unless you have used _GENTOO_.
The reason I mention this is because of the contrast between PORTAGE and DPKG. While
dpkg installs everything from binaries, portage usually downloads the source code,
and compiles everything. This has the obvious benefit that binaries compiled can
be machine tuned, making the system noticably faster. Unfortunately, build errors
can be a headache. Installation of binaries is supported, but rarely used.

3. __PACMAN__: This is the package manager that ships with _ARCH_ and tries to
combine the best of both worlds. Pacman itself installs binaries, while AUR
allows the users to use pacman to install packages from source too. The packages
present upstream, in this case, are usually rolling stone releases (As latest as
possible) and can _sometimes_ have bugs.


__NOTE__: Above information is an over simplification of the working of package
managers. What happens under the hood is a lot more complicated.

<br />

####Why do I think this is important?

Those who know me, (Or have read _ABOUT ME_) would know that lately, I've been
trying to build my own operating system using the LFS project. I was struck with
the choice of a package manager, as by default, LFS has none. I went with Portage,
since it compiles the packages, just like everything else in LFS. As I continued
with the build, my OS started to be more and more Gentoo-ey. It started pointing
out that I should read Gentoo forums before installing specific packages and so on.
I could as well have choosed Pacman or DPKG or Snappy to make it into ARCH, Debian
or Ubuntu.

<br />

####Why did I call this the _wrath_ of package managers?

As the package managers are the backbone of the operating systems, it is a good
idea to leave them alone to their musings. They do not like competition and if
you try to install Pacman on Debian or Portage on Arch, you will (_more likely than
not_) end up with a broken, unusable system as the different package managers
will step on each other's files and overwrite each other's essential files.
