---
title: "Using Mouse with VIM in the terminal"
layout: default
tags: tip
---

Just when you thought vim couldn't surprise you
anymore, vim strikes again.
As it turns out, vim supports mouse integration even
in the terminal. Not only that, the support is mind
blowingly simple and amazing. You can move your cursor,
select text and even resize your panes in a split screen.

Most websites just say to use
`set mouse=a` in your `.vimrc` to add mouse support to
your vim. However, this enables mouse in all modes and I
found that it can get very irritating if mouse gets moved
during typing in insert mode. Luckily vim also supports
selective usage of the mouse.

```
a = all
n = normal mode
v = visual mode
i = insert mode
```

There are other options too (check using `help mouse`).
I found that using:

`set mouse=nv`

(for normal and visual, but not insert mode) works best for me.
