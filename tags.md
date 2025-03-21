---
layout: page
title: Tags
permalink: /tags/
---

<div class="tags-page">
  <h2>Browse by Tag</h2>
  
  <div class="tag-cloud">
    {% assign all_tags = "" | split: "" %}
    {% for post in site.posts %}
      {% for tag in post.tags %}
        {% assign all_tags = all_tags | push: tag %}
      {% endfor %}
    {% endfor %}
    
    {% assign unique_tags = all_tags | uniq | sort %}
    
    {% for tag in unique_tags %}
      <a href="#{{ tag | slugify }}" class="tag-link">
        {{ tag }}
      </a>
    {% endfor %}
  </div>
  
  <div class="tag-groups">
    {% for tag in unique_tags %}
      <div class="tag-group" id="{{ tag | slugify }}">
        <h3>{{ tag }}</h3>
        <ul class="post-list">
          {% for post in site.posts %}
            {% if post.tags contains tag %}
              <li>
                <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
                <small class="post-date">{{ post.date | date: "%b %-d, %Y" }}</small>
              </li>
            {% endif %}
          {% endfor %}
        </ul>
      </div>
    {% endfor %}
  </div>
</div>