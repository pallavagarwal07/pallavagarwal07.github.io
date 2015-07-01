---
title: "Quick intro to custom Vim Mappings"
layout: default
tags: tip
---

One of the best things about vim is its ability to create
custom mappings for _almost_ any key in all modes.

Suppose you want Ctrl+S to save your document while you are
in insert mode, because pressing

```
<Esc>:w<Enter>i
```

to switch to normal mode, save the file, and return back
to insert mode is a bit too much. According to vim philosophy,
it actually __IS__ too much, and thus you can map Ctrl+S to
those keys just as easily.

For this, add the following to your vimrc

```
inoremap <C-S> <Esc>:w<Enter>i
```

####EXPLANATION:
The command has separate parts but follows the format

```
<cmd> <lhs> <rhs>
```

The command maps lhs to rhs in the mode specified by cmd.
`<cmd>` can be further broken down in the following format:

`<mode>[nore]map`

where the following modes are common (All
modes are covered in the following post)

```
(none): normal, visual, operator mode
i: insert mode
v: visual mode
n: normal mode
```

`nore` is used for no-remapping, i.e. the default functions
of `rhs` and not their aliases will be used. When skipped,
The `rhs` will be further resolved if a remapping is found.
Vim, even has a max resolve-depth in case of an infinite loop.

For `lhs` and `rhs` the keys are named as follows:

```
<C-a> : Ctrl + a
<S-a> : Shift + a
<A-a> : Alt + a
<C-S-a> : Ctrl + Shift + a
<Enter>
<BS> : Backspace
etc..
```

The whole list can be viewed
[here](http://vimdoc.sourceforge.net/htmldoc/intro.html#key-notation)
or using the `:help key-notation` command inside vim.
