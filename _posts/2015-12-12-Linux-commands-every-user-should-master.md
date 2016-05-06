---
title: "Linux commands every user should master"
layout: default
tags: post
---
When it comes to linux, there are some commands that you can't live without and
then there are some you _shouldn't_ live without. I mean sure, you can live your
life without ever using `grep` or `find` but you'd never believe how much
productive knowing a few more terminal commands can make you.

Here is a list of the commands we are going to take a look at:

0. _man_
1. _grep_
2. _find_
3. _sed_

<br/>

#### **The command that started it all: _man_**

I really hope you know this one. But in case you don't, well today is your
lucky day. This command is really special because it will, from today onwards
be your first guide to using **any** terminal command. `man` stands for
_manual_ and is literally your handbook of linux commands. Any time you are
wondering how to use a command, `sed` for example, open up your terminal and
type

```
man <command>
```

or as in this case,

```
man sed
```

and it will give you a quick summary of what the command is, and how to use
it. There isn't anything more than that to it, yet I use it multiple times
everyday when I forget the syntax of `chmod` command or have forgotten how
the `bash time` command is different from that packaged with `zsh`.

<br/>

#### **Search through files, content, outputs, basically anything: _grep_**

This one is basically a search command. But unlike the upcoming `find` command,
this one doesn't search for just the names of files. It searches through their
content as well. Not only that, it is also super handy when you have to filter
out lines that contain some specific content from let's say a huge output from
previous command. This command takes getting some used to, but after some time,
you wouldn't even believe you used to be able to get any work without it. Let's
start, shall we?

- **Content from files**

  Let's say you want to search for any files in which you have TODO written
  inside (as in code comments maybe?) also, you want the search to be case
  insensitive and search all subfolders of current folder too (recursively).
  You'd write:

  ```
  grep -i -r TODO .
  ```

  Now, I suggest you look up the flags (those dash followed by characters) I
  used in the above command using `man grep`. I will still tell you in case
  you don't have a means to run the `man` command right now.

  The `-i` flag is for case-insensistive search.

  The `-r` searches sub-folders recursively.

  `TODO` is the phrase we want to search for. You can even use regex
  expressions (which is where the true power lies), and that seems to be true
  for many linux commands you'll learn in future.

  `.` is the usual symbol for current directory. `..` can be used for parent
  directory, or a directory name can be given, relative to the current
  directory.

- **Content from stdin or _pipe_**

  If the last parameter `file or folder name to search` in previous command
  is not provided, then `grep` tries to search in `stdin`. Now, that doesn't
  mean you actually have to type the content, but being able to take content
  from stdin allows grep to use something much more useful in linux - **pipes**!
  What a pipe or ` | ` does is that it sends the output of one command as stdin
  to another. Thus, a command like:

  ```
  ls | grep -i txt
  ```

  will execute `ls` and then take that output and give it to `grep`. Now grep
  will execute its search on this content (output of `ls`). Thus, in above
  example, it will search for lines that will have txt in them.

<br/>

#### **The plain old but much more powerful than you thought _find_ command**

The `find` command is one of the most used commands in Linux.
`find` command is used to search and locate list of files and directories
matching arguments you specify.  `find` can be used in variety of conditions
with its various flags to find files by permissions, users, groups, file type,
date, size and other possible criteria.  The format for the `find` command is a
little unintuitive for those with a habit of using `grep` or `ag`. Like always,
I'd advice you to read the man page for `find` using `man find` command.

- **Files by their name**

  To find a file by its name, just use the following format:

  ```
  find <directory> -name <name>
  ```

  So, if you want to search for a file named `abc.txt` in current directory, you
  can do

  ```
  find . -name "abc.txt"
  ```

  or

  ```
  find . -name "*.txt"
  ```

  to find all files ending with `.txt`

  Note that the only compulsory argument is the directory name. The `-name` is
  just to filter the files by name. And as you may have guessed, there are a lot
  more filters at your disposal.
  This will also search all sub-directories in the current folder recursively.

- **Files using advanced filters**

  Let's look at the following command:

  ```
  find -maxdepth 4 -amin +3 -iname "PaLLaV" -size -4M -type f -user root
  ```

  This is an example of how multiple filters can be chained up to create an
  advanced search.

  * `-maxdepth 4` will go at max 4 levels down (in
  subdirectories) while searching.

  * `-amin +3` will keep only those files that were last accessed **more than**
    3 minutes ago (notice the `+` in `+3`).

  * `-iname "PaLLaV"` will search for files with name `pallav` WITHOUT caring
    about case sensitivity (`-name` would've been case sensitive).

  * `-size -4M` will only choose those results that are **less than** 4MegaBytes
    because of `-` in `-4M`.

  * `-type f` will filter out the files and ignore the directories.

  * `-user root` will only give out the files that are owned by `root`.

As you may have guessed, these are _not_ the only filters you can use. There are
actually tons more. You can literally phrase the command to find any file you
lost on your hard drive and only remember vague details about.

<br/>

#### **The stream editor with all powers of an editor: _sed_ **

I know I promised you a tutorial of _sed_, but the fact is, there is no way I
can do justice to its power in a few paragraphs. So, instead I'm going to refer
you to [this](http://www.grymoire.com/Unix/Sed.html#uh-0) tutorial. It's long,
but I really recommend you go through the starting parts. _sed_ has terrible
documentation and `man sed` doesn't help a lot in this case, because just
knowing the format of commands doesn't bring out its power at all. If you aren't
sold yet, I'll give you an easy example of `sed` usage. Let's say you ran
`ifconfig` and got the output:

```
enp9s0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 172.24.8.63  netmask 255.255.255.255  broadcast 172.24.8.63
        inet6 fe80::f276:1cff:fe0b:b377  prefixlen 64  scopeid 0x20<link>
        ether f0:76:1c:0b:b3:77  txqueuelen 1000  (Ethernet)
        RX packets 2578393  bytes 3323277819 (3.0 GiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 1368479  bytes 189953405 (181.1 MiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 0  (Local Loopback)
        RX packets 529  bytes 1361550 (1.2 MiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 529  bytes 1361550 (1.2 MiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
```

but you just want the output to be type followed by ip addr, for every ip
address as in:

```
 inet 172.24.8.63
 netmask 255.255.255.255
 broadcast 172.24.8.63

 inet 127.0.0.1
 netmask 255.0.0.0
```

Let's try to make the output like that:

1. First grep to filter out the lines that have IP addresses.

   ```
   ifconfig | grep -P "(\d{1,3}\.){3}\d{1,3}"
   ```

   Couple of things to note: The `-P` is for using perl type regex.
   This allows us to use `\d` for digits, in sed we'll still have to
   use `[0-9]` as `\d` format isn't supported. Then we say that there
   will be atleast 1 and at most 3 digits `{1,3}`. Then it will be
   followed by a dot `\.`. Read up on regex if you don't know why the
   dot has been preceded by a `\ `. Then this whole group (digits and dot)
   is repeated exactly 3 times, followed by another group of 1-3 digits.

   This filters out the lines with IP addresses as in:

   ```
       inet 172.24.8.63  netmask 255.255.255.255  broadcast 172.24.8.63
       inet 127.0.0.1  netmask 255.0.0.0
   ```

2. Now we use sed to add newlines after every IP address.

   ```
   sed -r "s|([0-9]{1,3}\.){3}[0-9]{1,3}|\0\n|g"
   ```

   Now, the `-r` is to use extended regular expressions. `s` is for
   substitute command. `|` is the separator (can be anything not used
   in the substitution pattern). This is followed by the same regex
   expression as before, but instead of `\d` we have used `[0-9]` as
   `\d` isn't supported by `sed`. Then we use another separator `|`.
   Then we have the substitution content. `\0` just puts the whole
   pattern that was matched. This is needed as we do not want to delete
   the original content. The `\n` is for a newline. The `|g` is another
   separator followed by `global` without which only the first match in
   every line will be replaced. Now the output is:

   ```
           inet 172.24.8.63
     netmask 255.255.255.255
     broadcast 172.24.8.63

           inet 127.0.0.1
     netmask 255.0.0.0
   ```

   Unfortunately, the formatting doesn't look too good.

3. Let's add a new sed command to eat all the beginning spaces:

   ```
   sed -r "s|^ *||"
   ```

   This one's easy, by using `^`, we are substituting for all the spaces
   in the beginning of the line and replacing with nothing.
   This gives us the final output:

   ```
   inet 172.24.8.63
   netmask 255.255.255.255
   broadcast 172.24.8.63

   inet 127.0.0.1
   netmask 255.0.0.0
   ```

Note, our final command thus will be:

```
ifconfig | grep -P "(\d{1,3}\.){3}\d{1,3}" | sed -r
    "s|([0-9]{1,3}\.){3}[0-9]{1,3}|\0\n|g" | sed -r "s|^ *||"
```

and while this might seem like too much work, think about how much you'd
have to write if you were to create a script to do these transformations
using C++ or python. These commands allow creation of really clean and
compact scripts (_OK, maybe **just** compact scripts_).

**Now, that you know the secrets, get cracking!**
<br/><br/>

_I hope you enjoyed reading this post._

**Consider sharing this article using the links below.**