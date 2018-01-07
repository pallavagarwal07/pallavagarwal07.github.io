---
title: "Configuration Management in Linux"
layout: default
tags: post
---
You can't yourself a linux enthusiast if you've never run into the problem
of sorting out your configuration files. All of your precious files like
`.bashrc`, `.zshrc`, `.vimrc`, `.emacs`, `.fonts`, `.Xdefaults` are some of
the ones that can take a lot of pain to customize from the ground up.

Like most people, I started out by always backing up my important config files.
But the list soon got so huge that I started having trouble remebering which
files to back up, and to do it after every change.

So, obviously, I moved on to the next obvious option, **symlinks**! I started
to keep all my config files in a single folder and started to symlink them to
the places that they belonged to. I kept this up for a few months (mostly
because it didn't seem like any trouble) when I finally decided to change my
operating system. And the problem hit me. I already had over 50 configuration
files under version control and had no real way to put them in correct places in
the new OS. These files had accumulated over time and to put them back at
correct places was an endeavour I wasn't going to undertake.

Now I tried to look for a tool that would help me manage and restore dotfiles
at will. A friend suggested using `vcsh` and `mr`. You can find the relevant
article [here](http://srijanshetty.in/technical/vcsh-mr-dotfiles-nirvana/).
I would've tried that too but it seemed too complicated to be an elegant way
to handle this problem. For one thing, I wanted a script that could be a part
of my dotfiles and not an external dependency. So as you might've already
guessed, I started to plan out my own way to manage my dotfiles. So without
further ado, I present to you:

<br/>

#### __*Config Management, the UNIX way:*__
First things first, [here](https://github.com/pallavagarwal07/ConfigManagement)
is the repository for my project. The configuration system is inspired by
VIM's modelines, which are basically comments that can control VIM's settings
separately for code files. So, something like

```
// vim: set nonumbers:
```

in a source code's top or bottom lines would turn off line numbering in VIM
when opening that source file. This is elegant as every config file has some
comment system (and isn't worth using if it doesn't) and file properties can
be easily specified in this way for every file.

Let's look at the file structure.

```
myconfig
    ├── backup
    │   ├── 2015-11-30_13-46-31
    │   └── ........
    ├── configs
    │   ├── nvimrc
    │   ├── Xdefaults
    │   └── ........
    ├── configure.py
    └── current_state
```

During the initial setup, you are only concerned with `configure.py`, and the
folder `configs`. An empty `current_state` file may be needed. Your dotfiles
and config folders go inside `configs` folder. The files can have any name
and do not need to be named the same as the final target. For eg. `.vimrc`
when kept inside the `configs` folder can be named `mysuperamazingvimconfig`
and it won't matter. You can also group files of similar purpose together
as the files will be searched recursively.

Now how do the files know where to go? Here is the easy part. Inside the
corrsponding file, you just mention where that files need to go. So, for
your `mysuperamazingvimconfig`, you will have the following in your source:

```
" place ''~/.vimrc''
```

The first double quote is to start a comment and the rest is the needed command.
Please note that the path is enclosed by a pair of `two single quotes` not a
double quote. Also, this comment will be looked for in the top 3 and the bottom
3 lines of the source code.

Another alternative for the command is:

```
" place &~/.vimrc&
```

especially if the file has a special meaning for the single quote (like
`.Xdefaults`).

<br/>

_**What about the folders?**_

For the folder that need to be symlinked, you create a file named folder_config
inside the folder and put the same command as above. If the folder itself is
being symlinked, then it won't be checked further for symlinkable files/folders.
The rest of the folders, obviously will still be. For example, if you have a
folder named fonts in `configs` and you want to place it as `~/.fonts`, you will
make a file `folder_config` inside `fonts` folder with the content:

```
place ''~/.fonts''
```

and you are done. All you have to do to create/update the symlinks is run
`./configure.py` or `python2 configure.py`.

<br/><br/>

#### __*Under the Hood*__:

A lot of cool stuff happens under under the hood to ensure that no data loss
occurs and no redundant files are created when `configure.py` is executed.
Your current symlink status is stored in `current_status` so that the next time
you change a `place ''<path>''`, the old symlink is deleted to prevent
redundancy. If you manually remove the file from configuration management and
place the real file in the actual place, then it will take care not to touch it
even if it was part of `current_status`. While adding a file to config system
for first time, if the file at target path is not a symlink but a real file, it
is copied to the backups folder under current date and time before being
replaced by a symlink to prevent data loss.

<br/><br/>

_I hope you enjoyed reading this article._

**Consider sharing this article using the links below.**