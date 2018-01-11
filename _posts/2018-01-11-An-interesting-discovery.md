---
title: "Mistakes and discoveries"
layout: default
tags: post
---

The story starts with a blunder. In fact, my first major blunder of the year. A
couple of weeks ago, I was enthusiastically adding continuous integration and
deployment to my projects. It the midst of it, I found out that GitLab CI can be
used to build artifacts for deployment. For example, a project could be build,
and provide the built binaries as artifacts.

Since I had been adding CIs to many of my projects, one of my requirements was
to have PDFs for my documents (resume, project papers for instance) to be built
automatically any time I change the source on Overleaf. For those who don't
know, Overleaf is an online service that allows people to write and compile
Latex online.  However, there is no way to directly link to the latest built
PDF. I realized that GitLab's pipeline artifacts could be used to automatically
generate the PDF every time the source code is changed.

Luckily, Overleaf also provides a Git URL to access the source code of the
project. Now initially, my plan was to somehow automate the extraction of the
source code of the project from overleaf, and then build it in GitLab. But
having a Git interface to Overleaf meant that I could just use the GitLab's
[repository
mirror](https://docs.gitlab.com/ee/workflow/repository_mirroring.html) feature!
If you haven't had any experience with GitLab, repository mirror feature just
checks the source of the Git repository every hour, and in case the source is
changed, it pulls the repo and syncs the changes to the GitLab repo. If pipeline
is set up, then the pipeline will be built everytime the sync shows change in
the source code, and the built PDF would be updated. Simple right?

Anyway, I set it up as such for my resume and one of my upcoming research
papers. I even made shortcuts from `https://pallav.xyz/resume` and similar URLs
pointing to the link of the artifact. I thought it was a wonderful setup
until...

**The blunder**

The git URL provided by Overleaf does not need any authentication.  When I set
up GitLab mirror sync, the repository showed the URL of the synced repository
right under the title.

<img src="/img/mirror.png" alt="GitLab mirror image" class="img-responsive"> <br
/>

This meant that anyone with that URL could clone, and make arbitrary changes to
the PDF that was so conviniently updating every hour. That means, anybody
could've changed my resume to say absolutely anything. That's scary.

Out of panic, I first made a new repository on GitLab which pulls the Overleaf
repo as a part of the pipeline, and set the URL as a secret variable instead of
the mirror URL. Then I set up a pipeline schedule for the new GitLab repository,
so that it too checks for updates every hour from the Overleaf repo.

Once the new repo pipeline was working, I duplicated the Overleaf project to
another project and deleted the original one (since the URL was in a way
compromised). I went ahead and changed all redirects (like `pallav.xyz/resume`)
to the new repo's artifacts.  Once the disaster mitigation was complete, it
occured to me that I could not possibly be the only one to have made this error.

**The Discovery**

With my researcher mode on, I started looking out for other projects who
might've done the same error as me. For one thing, even if some person was smart
enough to not publically expose the URL, even merging the branch of an overleaf
project to an existing git project would, by default be named...

```
Merge https://git.overleaf.com/xxxxxxxxxxxxxxxxxxxx
```

so, it was still likely that people may not have realized that the innocent
looking git.overleaf.com URL would give every person in the world, write access
to their project.

But you know what's even more interesting? In the above URL, if I replace `git`
by `www`, it would become the read-write URL to the actual project in overleaf.
You don't even need to use Git to exploit this!

Coming back to my researcher mode - I knew what my first place to look should
be - GitHub. GitHub has an amazing advanced search. So I went ahead and in
GitHub and searched for `git.overleaf.com`.  See what I mean?

<img src="/img/overleaf.png" alt="Overleaf merges on GitHub" class="img-responsive">
<br />

**Over 2000 results in the commits section itself!**

A quick look at the projects showed multiple resumes, and other documents. Apart
from the merge requests, there were people who were using the Overleaf Git URL
as sub-modules in their repositories. Since the submodules aren't synced, it was
clear that it was meant for their own convinience, and the actual document was
not meant to be public (let alone read-writable by world). Such git-modules'
URLs were visible in the `.gitmodules` files of repositories. The interesting
ones in this category were unpublished papers, which were (are) still undergoing
work/research. 😞

<br />

**Conclusion?**

Well, for one thing, I'll be a lot more careful about what I put online. Hopefully
this article will also encourage other people to follow suit.

<br />

Anyway, that's all for today. In case you liked the article, share it with your
friends 😊

<br/>
