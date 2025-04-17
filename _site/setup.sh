#!/bin/bash

# Exit on any error
set -e

# Create necessary directories
echo "Creating required directories..."
mkdir -p _posts _layouts images

# Create a layout for blog posts
echo "Creating blog post layout template..."
cat > _layouts/post.html << 'EOF'
---
layout: default
---
<div class="post">
  <h1>{{ page.title }}</h1>
  <p class="post-date">{{ page.date | date: "%B %d, %Y" }}</p>
  
  <div class="post-content">
    {{ content }}
  </div>
  
  <a href="/blog" class="back-link">← Back to all posts</a>
</div>
EOF

# Update _config.yml to support blog posts
echo "Updating _config.yml..."
if grep -q "permalink:" _config.yml; then
  echo "Permalink already exists in _config.yml"
else
  cat >> _config.yml << 'EOF'

# Blog settings
permalink: /blog/:year/:month/:day/:title/

# Collections
collections:
  posts:
    output: true
EOF
fi

# Create CSS for the blog
echo "Creating CSS for blog and photos..."
cat > blog-styles.css << 'EOF'
/* Blog post styling */
.post-preview {
  margin-bottom: 25px;
  padding-bottom: 15px;
  border-bottom: 1px solid #eee;
}

.post-date {
  color: #666;
  font-style: italic;
  margin-bottom: 10px;
}

.post-excerpt {
  margin-top: 10px;
}

.back-link {
  display: inline-block;
  margin-top: 20px;
  color: #4285f4;
  text-decoration: none;
}

.back-link:hover {
  text-decoration: underline;
}

/* Photo gallery styling */
.photo-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
  grid-gap: 15px;
}

.photo-item img {
  width: 100%;
  height: auto;
  object-fit: cover;
  border-radius: 5px;
}
EOF

# Create first blog post
echo "Creating first blog post..."
TODAY=$(date +"%Y-%m-%d")
cat > _posts/$TODAY-my-first-blog-post.md << EOF
---
layout: post
title: "My First Blog Post"
date: $TODAY
categories: research
excerpt_separator: <!--more-->
---

Hello world! This is my first blog post on my academic website.

<!--more-->

In this blog, I'll be sharing my thoughts and insights about:

- My research in Computer Architecture and Computer Networks
- Near-Memory Processing (NMP) challenges and opportunities
- Domain-Specific Architectures (DSA)
- My experiences as a PhD student
- Technical tutorials and code samples

Stay tuned for more content coming soon!
EOF

# Update index.md to include blog functionality
echo "Updating index.md to include blog tab functionality..."

# Backup original index.md
cp index.md index.md.backup

# Extract content from the current index.md up to the <script> tag
awk '/<script>/,0{f=1} !f{print}' index.md > index.md.temp

# Add blog post listing functionality
cat >> index.md.temp << 'EOF'
<script>
// Function to show/hide news items
document.getElementById('show-more').onclick = function() {
  var items = document.querySelectorAll('#news-list li');
  for (var i = 5; i < items.length; i++) {
    items[i].style.display = 'list-item';
  }
  this.style.display = 'none';
};

// Function to handle tab navigation
function openTab(evt, tabName) {
  // Hide all tab content
  var tabcontent = document.getElementsByClassName("tab-content");
  for (var i = 0; i < tabcontent.length; i++) {
    tabcontent[i].classList.remove("active");
  }
  
  // Remove "active" class from all tab links
  var tablinks = document.getElementsByClassName("tab-link");
  for (var i = 0; i < tablinks.length; i++) {
    tablinks[i].classList.remove("active");
  }
  
  // Show the current tab and add "active" class to the button that opened the tab
  document.getElementById(tabName).classList.add("active");
  evt.currentTarget.classList.add("active");
}

// Set the default tab (Home) as active when the page loads
document.addEventListener('DOMContentLoaded', function() {
  document.getElementById('home').classList.add('active');
  document.querySelector('.tab-link').classList.add('active');
});
</script>

<link rel="stylesheet" href="blog-styles.css">
EOF

# Move the updated content back
mv index.md.temp index.md

echo "Setup complete! Here's what was created:"
echo "- _posts/: Directory for blog posts with your first post"
echo "- _layouts/: Directory with post.html template"
echo "- images/: Directory for your photo gallery"
echo "- blog-styles.css: CSS styles for blogs and photos"
echo "- Updated _config.yml with blog settings"
echo "- Updated index.md with blog functionality"
echo ""
echo "The original index.md was backed up as index.md.backup"
echo ""
echo "Next steps:"
echo "1. Make sure your index.md has the proper tab structure"
echo "2. Add images to the 'images' folder for your photo gallery"
echo "3. Push changes to GitHub to see your updated site"
echo "4. To create a new blog post, just add a new .md file to the _posts directory"
