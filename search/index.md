---
layout: default
title: Search
---

{% for post in site.posts %}
{{post.title | strip_html | strip_newlines}}


{{post.content | strip_html | strip_newlines | truncatewords:50}}
{% endfor %}
