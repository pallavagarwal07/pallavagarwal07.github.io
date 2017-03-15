---
title: "Google Summer of Code with Gentoo"
layout: default
tags: post
---
I am excited to say that I've been accepted for this year's summer of code under
Gentoo Organisation. [This section of the blog](/gsoc) will be dedicated to documenting
anything and everything I learn that is interesting or remotely related to my project.

My proposal for the project can be found [here](/img/gsoc.pdf). The abstract for the
same has been given below.
> Gentoo is an operating system with extreme focus on configurability and performance.
> To provide fully customizable experience, without interfering with the stability of
> the system, Gentoo has a concept of masked packages. These masked packages (or
> versions) are either untested, or are known to be unstable and are installed only if
> the user explicitly unmasks them. While this concept is a boon to the stability of
> the operating system, the current implementation requires the packages to be tested
> manually by a team of developers. This significantly increases the time in which new
> packages are made safely available to the users. The goal of this project is to
> provide a mechanism to test and stabilize the packages automatically with little or
> no human intervention.

The first phase of summer of code is the community bonding period (April 23rd - May 22nd)
, which has already started. The first and foremosts tasks for now (community bonding)
are:

1. Get familiar with architecture testing.
2. Contact people who can give suggestion on my project.
3. Create a plan of action for the coding period, by taking the suggestions into account
with the current plans.


For the first, architecture testing, I tested and stabilized a new version of gitflow a
few days ago.  The package itself was small, with no complicated dependencies and was
easy enough to handle. But since, my project also aims to create a platform for
maintainers to create automated test scripts, I had been thinking of ways to implement
that.

I have also been following Agostino's (Ago's) [blog](https://blogs.gentoo.org/ago/) for
rules/tips pertaining to architecture testing, specifically for the more difficult to
test things like Kernel, libraries, kernel dependent packages (like virtualbox) etc.

Lastly, I've been looking at the source of package management and testing related tools
in Gentoo, including tatt and eix.


I would keep on updating this page with more information as I find it.

<i>Thanks for reading</i>
<br /><br />
