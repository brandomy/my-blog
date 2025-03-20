#!/bin/bash

# Create a markdown file to store the report
echo "# Jekyll Project Structure Report" > jekyll-project-report.md
echo "*Generated: $(date)*" >> jekyll-project-report.md
echo "" >> jekyll-project-report.md

# Basic system information
echo "## Basic System Information" >> jekyll-project-report.md
echo "- **Operating System:** $(uname -s)" >> jekyll-project-report.md
echo "- **Ruby Version:** $(ruby -v 2>/dev/null || echo 'Not available')" >> jekyll-project-report.md
echo "- **Jekyll Version:** $(jekyll -v 2>/dev/null || echo 'Not available')" >> jekyll-project-report.md
echo "- **Bundler Version:** $(bundle -v 2>/dev/null || echo 'Not available')" >> jekyll-project-report.md
echo "" >> jekyll-project-report.md

# Project directory structure
echo "## Project Directory Structure" >> jekyll-project-report.md
echo '```' >> jekyll-project-report.md
find . -maxdepth 3 -type d -not -path "*/\.*" -not -path "*/_site*" -not -path "*/node_modules*" | sort >> jekyll-project-report.md
echo '```' >> jekyll-project-report.md
echo "" >> jekyll-project-report.md

# List of files in important directories
echo "## Important Files" >> jekyll-project-report.md

# Root directory files
echo "### Root Directory Files" >> jekyll-project-report.md
echo '```' >> jekyll-project-report.md
find . -maxdepth 1 -type f -not -path "*/\.*" | sort >> jekyll-project-report.md
echo '```' >> jekyll-project-report.md
echo "" >> jekyll-project-report.md

# _posts directory files - just list them without trying to show content
echo "### Files in _posts Directory" >> jekyll-project-report.md
echo '```' >> jekyll-project-report.md
if [ -d _posts ]; then
  find _posts -type f | sort >> jekyll-project-report.md
else
  echo "No _posts directory found!" >> jekyll-project-report.md
fi
echo '```' >> jekyll-project-report.md
echo "" >> jekyll-project-report.md

# _layouts directory files
echo "### Files in _layouts Directory" >> jekyll-project-report.md
echo '```' >> jekyll-project-report.md
if [ -d _layouts ]; then
  find _layouts -type f | sort >> jekyll-project-report.md
else
  echo "No _layouts directory found (this is normal if using a gem-based theme)!" >> jekyll-project-report.md
fi
echo '```' >> jekyll-project-report.md
echo "" >> jekyll-project-report.md

# _includes directory files
echo "### Files in _includes Directory" >> jekyll-project-report.md
echo '```' >> jekyll-project-report.md
if [ -d _includes ]; then
  find _includes -type f | sort >> jekyll-project-report.md
else
  echo "No _includes directory found (this is normal if using a gem-based theme)!" >> jekyll-project-report.md
fi
echo '```' >> jekyll-project-report.md
echo "" >> jekyll-project-report.md

# Safely display config.yml
echo "## Configuration Files" >> jekyll-project-report.md
echo "### _config.yml" >> jekyll-project-report.md
echo '```yaml' >> jekyll-project-report.md
if [ -f _config.yml ]; then
  # Use grep to extract only key configuration items to avoid potential encoding issues
  echo "# Key settings extracted from _config.yml:" >> jekyll-project-report.md
  grep -E "^title:|^description:|^url:|^baseurl:|^theme:|^future:|^permalink:|^plugins:" _config.yml >> jekyll-project-report.md
else
  echo "File not found!" >> jekyll-project-report.md
fi
echo '```' >> jekyll-project-report.md
echo "" >> jekyll-project-report.md

# Safely display Gemfile
echo "### Gemfile Key Settings" >> jekyll-project-report.md
echo '```ruby' >> jekyll-project-report.md
if [ -f Gemfile ]; then
  # Extract just the important lines
  grep -E "gem \"jekyll|gem \"minima|gem \"github-pages|jekyll_plugins" Gemfile >> jekyll-project-report.md
else
  echo "File not found!" >> jekyll-project-report.md
fi
echo '```' >> jekyll-project-report.md
echo "" >> jekyll-project-report.md

# Safely display index.md
echo "### index.md Front Matter" >> jekyll-project-report.md
echo '```yaml' >> jekyll-project-report.md
if [ -f index.md ]; then
  # Just extract the front matter 
  sed -n '/^---$/,/^---$/p' index.md >> jekyll-project-report.md
elif [ -f index.html ]; then
  sed -n '/^---$/,/^---$/p' index.html >> jekyll-project-report.md
else
  echo "No index file found!" >> jekyll-project-report.md
fi
echo '```' >> jekyll-project-report.md
echo "" >> jekyll-project-report.md

# Post front matter check - without displaying full content
echo "## Post Front Matter Check" >> jekyll-project-report.md
if [ -d _posts ] && [ "$(find _posts -type f -name "*.md" | wc -l)" -gt 0 ]; then
  # For each markdown file in _posts, extract just the front matter
  for post in _posts/*.md; do
    echo "### $(basename "$post")" >> jekyll-project-report.md
    echo '```yaml' >> jekyll-project-report.md
    sed -n '/^---$/,/^---$/p' "$post" >> jekyll-project-report.md
    echo '```' >> jekyll-project-report.md
  done
else
  echo "No posts found to check." >> jekyll-project-report.md
fi
echo "" >> jekyll-project-report.md

# Theme details
echo "## Theme Details" >> jekyll-project-report.md
THEME_CHECK=$(bundle show minima 2>/dev/null)
if [ $? -eq 0 ]; then
  echo "✅ Minima theme is installed." >> jekyll-project-report.md
  echo "**Theme location:** $THEME_CHECK" >> jekyll-project-report.md
else
  echo "❌ Minima theme is not installed or not being used." >> jekyll-project-report.md
fi
echo "" >> jekyll-project-report.md

# Key files check
echo "## Key Files Check" >> jekyll-project-report.md
FILES_TO_CHECK=("index.md" "index.html" "_config.yml" "Gemfile" "Gemfile.lock")
for file in "${FILES_TO_CHECK[@]}"; do
  if [ -f "$file" ]; then
    echo "- ✅ $file exists" >> jekyll-project-report.md
  else
    echo "- ❌ $file doesn't exist" >> jekyll-project-report.md
  fi
done
echo "" >> jekyll-project-report.md

# Future posts check - safer version
echo "## Future Posts Check" >> jekyll-project-report.md
FUTURE_CHECK=$(grep -l "^date: 202[4-9]" _posts/*.md 2>/dev/null)
if [ -n "$FUTURE_CHECK" ]; then
  echo "⚠️ Future-dated posts found! This might prevent posts from appearing." >> jekyll-project-report.md
  echo "Consider adding 'future: true' to _config.yml" >> jekyll-project-report.md
  echo "" >> jekyll-project-report.md
  echo "Files with future dates:" >> jekyll-project-report.md
  echo '```' >> jekyll-project-report.md
  echo "$FUTURE_CHECK" >> jekyll-project-report.md
  echo '```' >> jekyll-project-report.md
else
  echo "✅ No future-dated posts found." >> jekyll-project-report.md
fi
echo "" >> jekyll-project-report.md

# Add ending
echo "---" >> jekyll-project-report.md
echo "*End of Report*" >> jekyll-project-report.md

echo "Markdown report generated as jekyll-project-report.md"