#!/bin/bash

# Get the title and category
TITLE="$1"
CATEGORY="${2:-brand-thoughts}"  # Default to "brand-thoughts" if no category provided

# Format the date for front matter
DATE=$(date +"%Y-%m-%d %H:%M:%S %z")

# Create a filename-friendly version of the title
# Remove special chars and replace spaces with hyphens
FILENAME_TITLE=$(echo "$TITLE" | tr -cd '[:alnum:] ' | tr '[:upper:]' '[:lower:]' | tr ' ' '-')
FILENAME="_posts/$(date +"%Y-%m-%d")-$FILENAME_TITLE.md"

# Create the post file
cat > "$FILENAME" << EOF
---
layout: post
title: "$TITLE"
date: $DATE
category: $CATEGORY
---

![Image description](/assets/images/placeholder.jpg)

## Introduction

Your introduction goes here...

## Main Content

Your main content goes here...

## Conclusion

Your conclusion goes here...
EOF

echo "Created new post: $FILENAME"