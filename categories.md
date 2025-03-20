---
layout: page
title: Categories
permalink: /categories/
---

<div class="categories-list">
  <ul>
    {% for category in site.categories %}
      {% capture category_name %}{{ category | first }}{% endcapture %}
      <li>
        <a href="/categories/{{ category_name }}/">
          {{ category_name | capitalize | replace: '-', ' ' }}
        </a>
        ({{ site.categories[category_name].size }})
      </li>
    {% endfor %}
  </ul>
</div>