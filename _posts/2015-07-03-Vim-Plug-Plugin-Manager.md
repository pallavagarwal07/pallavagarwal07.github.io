---
title: "Plugin Management in VIM"
layout: default
img: vim-plug.png
img-alt: Screenshot of vim-plug plugin manager in action
tags: post
---

_What I've written in this post is my opinion, and should
not be taken as fact. There may be features I don't know
about, and my preference order may not be same as yours._

Here is a quick overview of the plugin managers that I've used,
ending with explanaions on how to use my personal favorite,
Vim-Plug. You may skip the comparision section if you just want
to be started quickly.

<br />

### 3. PATHOGEN

No discussion of package managers is complete without mentioning
pathogen. Pathogen is one of the oldest Package Manager for vim.
It simply allows you to clone every plugin into a separate directory
inside a bundle folder.
This way, all plugins can retain their git directories, and can be
updated with proper git commands. All Pathogen does, is ensure that
all plugins get loaded at runtime when vim is started.

__JUDGEMENT__: Too low level. You cannot disable and enable plugins as
easily as other package managers, your plugins aren't shown in vimrc.

<br />

### 2. VUNDLE

Vundle is the plugin manager I've used the longest. All plugins
can be listed in your vimrc, and you don't have to clone each one
manually. A simple `:PluginInstall` takes care of the plugins'
installations. Commenting out a single line from vimrc keeps
that plugin from loading up. Updating plugins and upgrading VUNDLE
is just as easy as the install command.

__JUDGEMENT__: Vundle has some difficult to remember boilerplate
code, and the plugin install is single threaded. On my system,
that takes a significantly more time (around 5x) than the multi
threaded Vim-Plug.

<br />

### 1. VIM-PLUG

Vim-Plug is a fork of Vundle, and thus has all its features.
Apart from that, if your vim is compiled with python or ruby
support, or you are using Neovim, Vim-Plug uses multi-threading
to clone your plugins in parallel. Vim-Plug also supports lazy
loading of plugins, which means that plugins may be set to load
only on specific commands, making your vim loadup much faster.

__JUDGEMENT__: I shifted to Vim-Plug a few weeks ago, and haven't
looked back since. I haven't encountered any problems and till now
it seems like the perfect plugin manager to me.


<br />
<br />

## Using Vim-Plug Plugin Manager

<br />

The good thing about Vim-Plug is that there's no boilerplate code
to make it work.

First, let us install Vim-Plug (This only needs to be done once).
Download [this](https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim)
file and place it `~/.vim/autoload`

Alternatively, you can use the following command to do it for you.
Paste the following inside a terminal.

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

At the top of vimrc, start the plugin manager with
the command `call plug#begin()`.

This starts the area within which all your plugins will be listed.
A plugin is listed in the following format:

```vimscript
Plug '<plugin name>'  "If the plugin is on vim-scripts.org
Plug '<username>/<pluginname>'  "If the plugin is on github.com
```

If the plugin is on vim-scripts.org, there would be a mirrored github
version which you can find via Google. For example, in case of

`https://github.com/vim-scripts/Wombat` the corresponding code
will be

```vimscript
Plug 'Wombat' "OR
Plug 'vim-scripts/Wombat'
```

while in the case of

`https://github.com/nanotech/jellybeans.vim` the corresponding code
will be

```vimscript
Plug 'nanotech/jellybeans.vim'
```

__Note: Text following `"` inside vimrc represents a comment.__


<br />

In case you want to lazy load a plugin,
[this](https://github.com/junegunn/vim-plug#on-demand-loading-of-plugins)
would be a good place to learn how.

Once you have listed all your plugins, end the call with
`call plug#end()`.

<br />

Putting all this together, we get:

```
call plug#begin()
Plug 'Wombat'
Plug 'nanotech/jellybeans.vim'
Plug 'scrooloose/nerdtree' , {'on': 'NERDTreeToggle'}  "Lazy Loading Example
call plug#end()
```

Put this in your .vimrc and you are good to go.


<br />

__PRO-TIP:__ If you are like me, and do not want to do the installation step
every time you have to use your vimrc on a new system, you can put the
following on the top of your vimrc. It basically checks if Vim-Plug is
installed, and downloads the file in the proper place if it isn't.


```
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif
```
