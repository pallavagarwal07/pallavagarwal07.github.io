---
title: Tips
layout: default
activate: tips
---

{% for post in site.tags.tip %}
__[{{post.title | upcase}}]({{post.url}})__
{{post.content | truncatewords:70 | sanitize}}

<br />

{% endfor %}
