---
title: "Simplifying CI with Nix"
layout: default
tags: post
---

So, I know I haven't written anything in a while, and that's because the last
semester was my heaviest yet. But now since that has passed, I no longer have
excuses to not write more articles. So go ahead, read on.

Before starting this article, if you do not know about Nix/NixOS, first go and
read up about it: [NixOS](https://nixos.org/nixos/about.html). NixOS in my
opinion is the single most promising operating system ever written. Instead
of being FHS compliant, NixOS keeps all files under hashed directory names
under `/nix/store` so that files from different packages never have any
collision. This allows the package manager to install multiple versions of the
same packages, along with deterministic and atomic builds and upgrades.

### Throwback
Now, I started using Nix a long time ago (~Sep 2015), often switching between
Arch and Nix depending on my usage. Mostly I had to switch to Arch every time I
couldn't figure out how to configure something in Nix (the methodologies, ike
the ideoligies are very different). About an year ago I switched to Nix
full-time (i.e. no other operating system on dual boot). The reason being that
I have learnt enough about the workings of Nix to make it do my day to day
bidding without much effort.

### Precursor
Every time I write a package for something, the installation procedure for
Nix is quite different from other operating systems. While most operating
systems would just ask you to compile and put the binary in `/usr/bin`, in
Nix you aren't allowed to change the global state of the OS. This means that
every package has to be accompanied by a config file that precisely lists all
dependencies and the build environment needed by the package. How the OS
provides that environment is none of our concern. If our package has a
dependency, I need to only write that in my package's config file, and even
without globally installing the package, my package would be able to build
against the dependencies as well as use them during runtime. It is like a
`virtualenv` except that it can be for any package, written in any language(s)
and that has dependencies of any language(s). It's how `virtualenv` would look
if it was 1000x smarter and more useful.

Since it simplifies development so much, I write my project's config file
before even starting the project. When new dependencies or requirements emerge,
it is a simple matter to modify a couple of lines in the config file. The best
thing about this approach is that my packages are always testable, even if I
reinstall the whole OS, I know that to run that package, I only need to run a
shell with that config file. No more iteratively installing dependencies based
on error messages.

### Weren't we supposed to talk about CI?
Yes! Sorry.. I was building up to it. One of the major advantages of Nix is
that Nix is a package manager that can be installed on other operating systems
as well. Thus an existing Arch or Ubuntu or ... OS can actually benefit from a
lot of this NIXey goodness by installing the Nix package manager. And very
recently, struggling with getting the dependencies "just right" on Travis, I
decided to exactly this.

### Wait.. Travis?
(Skip this if you know about Travis CI)
> Travis CI is a hosted, distributed continuous integration service used to
> build and test projects hosted at GitHub. Travis CI automatically detects
> when a commit has been made and pushed to a GitHub repository that is using
> Travis CI, and each time this happens, it will try to build the project and
> run tests. This includes commits to all branches, not just to the master
> branch.
> The point of this is that you can often discover very quickly if your commit
> broke something, and fix it before it becomes a problem.

### And the problem was?
When writing a program, it is very easy to lose track of all its dependencies
that you installed to get the code working, or the libraries it links against
that are under a different name on your OS as compared to the OS running on the
CI. At some point, everybody finds themselves battling with the package manager
on the CI, iteratively running the tests again and again and fixing the next
error that is reported on completion (failure) of the build.

I ran into this problem when I was trying to set up the CI for my blog's code.
Yes, the website you are reading - that's what I am talking about. Since the
final compiled product is a static website, I used to compile it on my PC and
upload the compiled files for hosting. But on my PC, the dependency things were
just fine - because - you guessed it - I had written a Nix config file for it.
Even so it was very hard to get it right on Travis, since it was running Ubuntu
and my blog uses a rather lot of dependencies (jekyll, as well as python NLP
libs for the search).

### Solution!
Then I realised that I don't need to take this trouble. Nix always builds
everything deterministically. Which means that if a build config file works
fine on my laptop, it would work fine on Travis too. And since it is possible
to install Nix on Ubuntu, I decided to see if it'd be able to use my existing
config file to build my code using Nix instead.

The result was a small bunch of scripts that you can just curl directly from
any build that uses a `default.nix` (Nix config) file for its builds and the
Travis build would first install Nix and then complete the build using the
Nix config file.

**[GitHub link for NixCI](https://github.com/pallavagarwal07/NixCI)**

### Example
The above link would also be a good example of how to use the Nix CI from a
project that uses Travis CI. Note that you can directly curl the installation
and configuration script from the above repository directly into your CI job.
The link below is a good example of how to do that.

To view an example of using this with GitLab CI:
[Click Here](https://gitlab.com/pallavagarwal07/pallavagarwal07.gitlab.io/blob/fa853cf54ec8c294e35f194feeb528d27295ae47/.gitlab-ci.yml)

Note that when sourcing from TravisCI, the script to run is `install-nix.sh`
but from GitLab CI, the script to run is `install-root.sh`. The latter is a
wrapper around the former but assumes that the user running the script is root
and the wrapper (`install-root.sh`) creates a non-root user with sudo
priviledges and runs the `install-nix.sh` script as the newly created user.
This is not required in Travis since the default user in Travis is non-root
and has sudo priviledges.
