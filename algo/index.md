---
layout: default
title: Behind the Scenes
scripts: algo.js
---

When I decided to make a blog, I wasn't sure how I
was going to make it. I had a variety of options,
whether to use [bootstrap](http://getbootstrap.com) or not.
Where to host my website? Whether I would need databases
or not. Or if I should just go ahead and install
[Wordpress](http://wordpress.org).

It was then that I heard of [Jekyll](http://jekyllrb.com).

> Jekyll is a simple, blog-aware, static site
> generator. It takes a template directory containing
> raw text files in various formats, runs it through
> a converter (like Markdown) and our Liquid renderer,
> and spits out a complete, ready-to-publish static
> website suitable for serving with your favorite web
> server.
>
> Jekyll also happens to be the engine behind
> GitHub Pages, which means you can use Jekyll to
> host your project’s page, blog, or website from
> GitHub’s servers for free.

__Jekyll had quite a few advantages that I was looking for:__

* I could write posts directly in markup (markdown or liquid)
* I could host it directly on github, and thus get a reliable
hosting for free.
* Jekyll would take care of preprocessing and I could code
in CoffeeScript, Sass without running their separate compilers.
* Since there was no server side (Jekyll creates a static
website), the pages would load up faster and unlike Wordpress,
my blog wouldn't succumb on loads of requests.
* Git support meant I would have complete version control
over the website.

<br />

__Unfortunately, there were also some disadvantages:__

* No server side!!! How would I implement search?
* No server side!!! How would I implement comments?
* No server side!!! You get the idea...


If you notice on the top, my site __does__ have a search.
Go ahead.. Try it out. It works.

But I didn't use google custom search, or any implementations
available on the internet. I tried almost all of them, but
none of them seemed to work that well. The primary problem with
those implementations was that they could be atmost of two
types:

1. Like google search. Redirect to another domain for
the search. This would probably give the most accurate
search results, but I don't want the search results
to be displayed on a different domain.

2. Based on Javascript - They would either search only
in the titles of everypage or download ALL the posts to the
user's computer to search through it all. Not a good idea
either.

<br />

__So how did I implement the search?__

Well.. Programming is one thing I'm good at. I needed a
way so that I could search through atleast the important words
of the content - Tags. But adding tags manually for each post
is definitely __not__ the way to go. I would be wasting too
much time writing tags. So I decided to use a python library
based on NLP (Natural Language Processing) to detect and extract
important words and phrases from the text. Once I did that, I had
to find a way to integrate those tags with the search functionality.

If you have ever used Jekyll (or Liquid), a lot of content is
manipulated using filters. These filters are basically snippets
of ruby code acting on the text/numbers/arrays. All I had to do
is to integrate my python program with ruby to create a filter to
extract tags from passed content. And voila, I had a page with all
posts' titles, and tags.

Now I wrote some javascript to search for the passed content in the
post data, and hide the ones with a low enough score (Each tag has
a weight score) and sort the rest.

If you navigate to the search results page, you can actually see
the tags that were generated, in your browser's developer tools.
If you want to implement something like this on your own blog,
or website, you can do so (the source code for everything is public on
[github](http://github.com/pallavagarwal07)). Although it would be nice if you gave me credit.

<br />

