---
title: Homepage
layout: default
img: HRK.jpg
---

Chances are, at some point, you’ll want to include images, downloads, or other digital assets along with your text content. While the syntax for linking to these resources differs between Markdown and Textile, the problem of working out where to store these files in your site is something everyone will face.

Because of Jekyll’s flexibility, there are many solutions to how to do this. One common solution is to create a folder in the root of the project directory called something like assets or downloads, into which any images, downloads or other resources are placed. Then, from within any post, they can be linked to using the site’s root as the path for the asset to include. Again, this will depend on the way your site’s (sub)domain and path are configured, but here some examples (in Markdown) of how you could do this using the site.url variable in a post.

