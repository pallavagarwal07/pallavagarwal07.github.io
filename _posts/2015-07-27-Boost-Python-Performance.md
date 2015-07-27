---
title: "Cython: Boost Python Code Performance"
layout: default
tags: tip
---

This tip is for those people who have been working on large python projects and the fact
that python is a slow language as compared to statically compiled languages has finally
caught up with them. This tip is about Cython, what it is and where can you use
it for maximum effect.

<br />

####__What is Cython?__
From the docs themselves,
> Cython is an optimising static compiler for both the Python programming language and
the extended Cython programming language (based on Pyrex).

>The Cython language is a superset of the Python language that additionally supports
calling C functions and declaring C types on variables and class attributes. This
allows the compiler to generate very efficient C code from Cython code. The C
code is generated once and then compiles with all major C/C++ compilers in CPython
2.6, 2.7 (2.4+ with Cython 0.20.x) as well as 3.2 and all later versions.

<br />

####__How do I use it?__
The documentation is pretty complete in itself. However to give you a general idea,
let's say you have to process two strings in python. First part of the processing requires
you to, lets say, find the
[Levenshtein distance](https://en.wikipedia.org/wiki/Levenshtein_distance) of the two
strings (Real World example from a project of mine). In python, even the most efficient
implementation of the algorithm was taking over two seconds for two significantly long
strings.

[Here](/img/code-diff.png) is the code and the changes I had to make for the speedup.

####__The result??__
Just with 4 lines of changes, I got over 15x speedup! What actually happens is that by
adding static type declarations to the most used variables in the time hogging fnx,
you are telling Cython to treat them as those types, and assign C semantics to those,
translating it to very efficient C code.


I'll now leave you alone, while you explore Cython's extensive documentation, and pride
yourself on reading this post.

I hope that helped. Please Share. :)
