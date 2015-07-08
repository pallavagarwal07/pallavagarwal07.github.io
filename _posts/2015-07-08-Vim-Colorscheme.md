---
title: "VIM: Setting a colorscheme"
layout: default
tags: post
---

Every good text editor deserves to have a customizable color scheme.
For vim, colorschemes are installed as any other plugin. Most colorschemes
can be downloaded as a `.vim` file. _If_ you are not using a plugin manager,
you need to copy the `.vim` file to an `autoload` folder inside a `.vim` folder
in your home directory.

However, if you _are_ using a plugin manager, (_as you should_), then depending
on the plugin manager, the colorscheme may be installed like a plugin. Personally,
I suggest you install a [colorscheme-pack](http://github.com/flazz/vim-colorschemes).
Since it makes it trivially easy to switch to any colorscheme (it has almost all
colorschemes you can think of, and you can create a pull request for missing ones).

<br />

###INSTALLATION:

<br />

####1. Vim-Plug
```
Plug 'flazz/vim-colorschemes'
```

<br />

####2. Vundle
```
Plugin 'flazz/vim-colorschemes'
```

<br />

####3. NeoBundle
```
NeoBundle 'flazz/vim-colorschemes'
```

<br />

####4. Pathogen
{% highlight bash %}
#Execute this in terminal:
cd ~/.vim/bundle
git clone https://github.com/flazz/vim-colorschemes
{% endhighlight %}

<br />

Once the colorscheme pack is installed, you can go ahead and try out
the colorschemes for yourself.

###USAGE:

Suppose you want to try out [jellybeans](http://github.com/nanotech/jellybeans.vim) colorscheme (_my favorite, BTW_).
Open up vim, and while in normal mode, type:

```
:colors jellybeans
```

Cool, right?

You can also try some other famous colorschemes:

1. [Solarized](http://github.com/altercation/vim-colors-solarized) - Both dark and light
background variants are widely popular.
2. [CodeSchool](https://github.com/29decibel/codeschool-vim-theme)
3. [RailsCasts](https://github.com/jgdavey/vim-railscasts)
4. [Vividchalk](https://github.com/tpope/vim-vividchalk) - High contrast colorscheme
5. [Lucius](https://github.com/jonathanfilip/vim-lucius) - One of the few good light color schemes
6. [Tomorrow Night](https://github.com/squarefrog/tomorrow-night.vim)
7. [Mustang](https://github.com/squarefrog/tomorrow-night.vim)


###TROUBLESHOOTING:

* Vim colorschemes can be tricky. Most colorschemes should work without any problems on
`gvim`, however, if you like to do all your work on terminal, then you _might_ not have
the luxury of 16 million colors. Most new terminals support atleast 256 colors.

* If you are unsure, there is a script called
[256color.pl](http://www.google.com/search?q=256color.pl) which can be used to find out
if your terminal supports all 256 colors. If it does, and vim still isn't showing
proper colors, try `:set t_Co=256` to force vim to use 256 colors. Alternatively
you can try setting the terminal name manually by typing `TERM=xterm-256color` in
a terminal and then running vim.

* Some themes however, would never appear well (or at all) on 256 color terminals.
That's because they don't support them. To still use those themes, you can use
plugin `csapprox` which would make map the colors to a 256 color pallete as best
as it can.

* If you can't find a colorscheme in the pack, that's probably because the names are
case sensitive for example, the correct names for the above are:

    - jellybeans
    - solarized
    - codeschool
    - railscasts
    - vividchalk
    - lucius
    - Tomorrow-Night
    - mustang

As always, use tab completion in vim to make searching for colorschemes easier.


<br />
