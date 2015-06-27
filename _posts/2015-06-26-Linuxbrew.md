---
title: "Package Management without root access - An intro to LinuxBrew"
layout: default
---


First a little background. At my college, we are given login accounts for
accessing PC's at the Computer Labs. I usually use them for setting up
my work environment for easy access through SSH. Though that makes it very easy
for me to resume my work, from any computer or laptop on the network, the preinstalled
packages are too old for my taste.

Have a look:

<img src="/img/oldVersions.png" alt="Versions before LinuxBrew update" class='img-responsive'>

This is what we want to end up with:

<img src="/img/newVersions.png" alt="Versions after LinuxBrew update" class='img-responsive'>
<br />

Of course, this can be achieved by compiling the packages after setting the prefix to
a directory with write permissions. But still, you can't deny the advantages of a
package manager over such an approach.

LinuxBrew is a Linux-fork of the popular Mac OS X HomeBrew package manager. One of its
foremost advantages is the fact that, by default, it installs packages in a folder in
home directory of the user and thus doesn't need root access.



### So, Let's get started!

First paste the following in a terminal:

{% highlight bash %}
git clone https://github.com/Homebrew/linuxbrew.git ~/.linuxbrew
{% endhighlight %}

<br />

_If the system doesn't have git installed, you can either try
the methods on the installation page ( [here](http://brew.sh/linuxbrew/) )
or download the files using a browser to a new `.linuxbrew` folder in
your home directory. (in case of ssh, download to a local computer
and scp them over)._

<br />

Now we need to tell linux where to look for executables for the packages
installed by LinuxBrew. To achieve that, add the following to your
`.bashrc` or `.zshrc` or `.profile` (Usually in your home directory)

<br />

{% highlight bash %}
export PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
{% endhighlight %}
For the changes to take place, either run `source .bashrc` (after replacing
.bashrc with the appropriate filename) or log-out and log-in.


<br />

####Congrats! LinuxBrew is now installed.

You can run `brew update` and `brew doctor` to see if everything has been setup
properly.

You can now run `brew install` to install packages as shown:

```bash
brew install git
brew install python
brew install curl
```

<br />

You can also head over to [Braumeister](http://braumeister.org) to check
which packages are supported. Since this is a fork of MacOS's homebrew,
not all linux are supported (yet) but this is a very actively developed
project and chances are, by the time you are reading this, it would
be as perfect as other linux package managers.

<br /><br />
