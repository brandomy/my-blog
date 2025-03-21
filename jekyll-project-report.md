# Jekyll Project Structure Report
*Generated: Fri Mar 21 11:13:25 +08 2025*

## Basic System Information
- **Operating System:** Darwin
- **Ruby Version:** ruby 3.4.2 (2025-02-15 revision d2930f8e7a) +PRISM [arm64-darwin24]
- **Jekyll Version:** jekyll 4.4.1
- **Bundler Version:** Bundler version 2.6.6

## Project Directory Structure
```
.
./_data
./_drafts
./_includes
./_layouts
./_posts
./assets
./assets/css
./assets/favicons
./assets/images
./categories
```

## Important Files
### Root Directory Files
```
./404.html
./CNAME
./Gemfile
./Gemfile.lock
./_config.yml
./about.md
./categories.md
./create-post.sh
./index.md
./jekyll-project-report.md
./jekyll-report-safe.sh
./tags.md
```

### Files in _posts Directory
```
_posts/.DS_Store
_posts/2025-03-01-welcome-to-brandomy.md
_posts/2025-03-21-test-post-with-tags.md
_posts/2025-03-21-thoughts-on-my-why.md
```

### Files in _layouts Directory
```
_layouts/category.html
_layouts/home.html
_layouts/post.html
```

### Files in _includes Directory
```
_includes/footer.html
_includes/head.html
_includes/social.html
```

## Configuration Files
### _config.yml
```yaml
# Key settings extracted from _config.yml:
title: Brandomy
description: >- 
baseurl: "" # With a custom domain, this should be empty
url: "https://blog.brandomy.com" # Your custom domain with https protocol
theme: minima
permalink: /:year/:month/:day/:title/
```

### Gemfile Key Settings
```ruby
gem "jekyll", "~> 4.4.1"
gem "minima", "~> 2.5"
# If you want to use GitHub Pages, remove the "gem "jekyll"" above and
# gem "github-pages", group: :jekyll_plugins
group :jekyll_plugins do
  gem "jekyll-feed", "~> 0.12"
```

### index.md Front Matter
```yaml
---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: home
---
```

## Post Front Matter Check
### 2025-03-01-welcome-to-brandomy.md
```yaml
---
layout: post
title: "Welcome to Brandomy"
date: 2025-03-20 08:00:00 +0800
category: brand-thoughts
tags:
  - Life Lessons
  - Small Wonders
  - Unexpected Joy
---
```
### 2025-03-21-test-post-with-tags.md
```yaml
---
layout: post
title: "Test Post with Tags"
date: 2025-03-22 12:00:00 +0800
category: brand-thoughts
tags:
  - Random Thoughts
  - Cool Designs
  - Memory Lane
---
```
### 2025-03-21-thoughts-on-my-why.md
```yaml
---
layout: post
title: "My Why?"
date: 2025-03-21 06:30:00 +0800
category: brand-thoughts
tags:
  - Life Lessons
  - Random Thoughts
  - Memory Lane
  - Spotted in China
---
```

## Theme Details
✅ Minima theme is installed.
**Theme location:** /opt/homebrew/lib/ruby/gems/3.4.0/gems/minima-2.5.2

## Key Files Check
- ✅ index.md exists
- ❌ index.html doesn't exist
- ✅ _config.yml exists
- ✅ Gemfile exists
- ✅ Gemfile.lock exists

## Future Posts Check
⚠️ Future-dated posts found! This might prevent posts from appearing.
Consider adding 'future: true' to _config.yml

Files with future dates:
```
_posts/2025-03-01-welcome-to-brandomy.md
_posts/2025-03-21-test-post-with-tags.md
_posts/2025-03-21-thoughts-on-my-why.md
```

---
*End of Report*
