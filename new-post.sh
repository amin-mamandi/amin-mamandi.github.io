#!/usr/bin/env bash

set -euo pipefail

if [ "$#" -lt 1 ]; then
  echo "Usage: ./new-post.sh \"Post title\""
  exit 1
fi

title="$*"
timestamp="$(date '+%Y-%m-%d %H:%M:%S %z')"
day_prefix="$(date '+%Y-%m-%d')"

slug="$(printf '%s' "$title" \
  | tr '[:upper:]' '[:lower:]' \
  | sed 's/[^a-z0-9]/-/g; s/-\{2,\}/-/g; s/^-//; s/-$//')"

if [ -z "$slug" ]; then
  echo "Could not create a valid filename from the title."
  exit 1
fi

mkdir -p "_posts"
post_path="_posts/${day_prefix}-${slug}.md"

if [ -e "$post_path" ]; then
  echo "Post already exists: $post_path"
  exit 1
fi

cat > "$post_path" <<EOF
---
title: "$title"
date: $timestamp
---

Write your post here.
EOF

echo "Created $post_path"
