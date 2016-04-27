---
title: GSoC_2016
layout: default
scripts: gsoc.js
---

{% for post in site.tags.gsoc %}
__[{{post.title | upcase}}]({{post.url}})__
{{post.content | truncatewords:70 | sanitize}}

<br />

{% endfor %}
