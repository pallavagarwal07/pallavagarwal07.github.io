---
title: "Vim Customization: Guide to writing your own VIMRC"
layout: default
tags: post
img: vim.jpg
img-alt: Screenshot of my vim configuration
---

Vim is all about customization. It comes from a long line
of ancestors starting from ed (1971), ex (1976), vi (1979),
and finally VIM (1991).

Vim is designed with the philosophy of speed and minimal
keystrokes. But I guess, if you're on this page, you
already know that.

The screenshot in above banner is how my vim looks currently.
(In case you can't see it, click [here](/img/vim.jpg))
If you'd notice, there's a bar on the top showing the buffers I
have currently open, the bottom bar shows the mode, character
encoding, github branch (when I'm inside a project). The code
is color highlighted, the indentation happens automatically
based on the language of the program, brackets match themselves,
it offers syntax completion, word completion, and even points
out errors in my programs. All in all, it is pretty much
everything you can ever want from a text editor.

Note that it is still running inside my terminal. I am
NOT running gvim. All of vim (even inside a console) can
be tweaked and configured to your liking.

Unfortunately, none of these customizations are on by default.
When you open vim for the first time, it looks somewhat like
this:

<img src="/img/vim-old.png" img-alt="vim before customizations" class="img-responsive">

Sadly, this is also the reason, many users don't try it
out. I mean who would guess that this is the same editor
as the one shown on the top.

Anyway, we will see how to customize your vim, so that
it doesn't just look like a premium text editor, but
functions better than one too.

<br />

__The rest of the post is split into multiple Tips and Posts,
each acting to explain a specific section of the vimrc.__

<br />

__1. PACKAGE MANAGER:__

_For any good vimrc, package management is a must. You
have multiple options to choose from, including
vim-plug, vundle, neobundle, pathogen etc. Follow the link
to get a quick rundown._

<br />

__2. COLORSCHEME:__

_Your vim colorscheme defines you. Whether you like
a dark background or light, whether you like comments
to be emphasised or dulled down. I cover some of
my personal favorites in this post._

<br />


__3. MAPPINGS:__

_This is where vim - specific awesomeness starts.
You can (literally) ask your editor to do what
you want with the keys that YOU want. I've covered
the basic ways of making vim keybindings in the above
link._

<br />


[__4. MOUSE CONTROL:__](/2015/06/30/Mouse-with-vim/)

_If you are using vim, you probably shouldn't be
using mouse at all. Yet, I sometimes find it convinient
to quickly resize panes and windows with my mouse.
It is good to know that vim has mouse support built in._

<br />


__5. PLUGINS:__

_What's a plugin manager, without all the lovely
plugins? As it turns out, some of the plugins can
be almost essential for an efficient workflow._


<br />

Now that you've learnt the secrets of your editor,
it is time to customize your own.

Happy VIMMING.
