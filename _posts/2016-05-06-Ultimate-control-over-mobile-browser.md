---
title: "Ultimate control over Mobile Browser with Firefox"
layout: default
img: firefox.png
img-alt: Firefox Banner
tags: tip
---
It is no secret that I love firefox. Even though sometimes, it can run a bit slower than
Chrome, Firefox has always provided me with better developer tools and better control
over all of my settings, even those which are usually unavailable via `about:config`.

However, it was only recently that I discovered, that `about:config` works flawlessly
on the mobile version of the firefox browser too. That means, all of the features you'd
think that mobile browsers miss, like proxy settings, cache, pipelining settings, etc.
can be found just by typing `about:config` on the URL.

Before you go off try, and fail - note that you need to understand how some of those
settings play together. For example, to set proxy settings, the URLs and the ports
themselves aren't enough. The `network.proxy.type` needs to be set to 2 (which is the
equivalent of the menu option "Manual proxy configuration")

<br /><br />
