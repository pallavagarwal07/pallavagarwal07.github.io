---
title: "Essential VIM plugins"
layout: default
tags: post
---

####RECAP:
First, lets recap. Vim plugins are used to add functionality to vim. That functionality
can be syntax highlighting, bracket matching, mode switching, easy file searching etc.
Pretty much, there's a plugin for every functionality that is not built-in to vim.

<br />

####INSTALLATIONS:
The way of installation varies with the type of plugin manager you are using.
Almost all plugins are either developed or backed up on github. Most plugin managers
make it trivial to install plugins from github repositories.

For pathogen, clone the plugin in the `bundle` folder in the `.vim` directory
in your home folder.

For Vundle, NeoBundle, Vim-Plug, add

```
Plugin '<key>'              " OR
NeoBundle '<key>'           " OR
Plug '<key>'
```

respectively to your `.vimrc`. Where _&lt;key&gt;_ for a plugin with github link
`https://github.com/scrooloose/nerdcommenter`, would be

`scrooloose/nerdcommenter`.


<br />

1. [AIRLINE](https://github.com/bling/vim-airline): I used to think I could live without
this plugin. It usually made the vim startup a bit slower, and I never liked that. But
once I started working on actual projects, Airline became an essential plugin for me.
Airline displays a top and a bottom status bar in vim, with information about open
buffers, current mode, text encoding, git branch etc.

2. [NERDCOMMENTER](https://github.com/scrooloose/nerdcommenter): Nerd Commenter makes
commenting and uncommenting lines of code extremely simple. It is ideal when debugging
code as you can comment out lines with a simple keystroke irrespective of the language
your code is in.

3. [ZEAVIM](https://github.com/KabbAmine/zeavim.vim): This is an integration plugin
for Zeal app. You can jump to the documentation of any term of any language just by
pressing a sequence of keys from inside vim.

4. [AUTO-PAIRS-GENTLE](https://github.com/vim-scripts/auto-pairs-gentle): You know how
every code editor auto completes your ending braces? This plugin gives you the same
functionality inside vim.

5. [EASYMOTION](https://github.com/Lokaltog/vim-easymotion): This comes last in my list
because I've almost stopped using it. You can jump to any character or word in a
particular FOV using a few keystrokes. I however find it more natural to use relative
numbering to move up and down and `f` key to move left and right on the same line.


<br />

I would also like to mention `AutoComplPop` and `YouCompleteMe` plugins for syntax
completion. However, I feel that vim's functionality is best expressed using the
inbuilt keys, as you can control the type of completion (filename, line, word,
syntax, ctags etc.)


<br />

I also recommend that you look at other users' vimrcs for more plugins. You never
know what you'll discover. [Here's](https://github.com/pallavagarwal07/_vim) mine
to start with.

<br />

__BEST OF LUCK CUSTOMIZING YOUR VIMRC!__

<br />

