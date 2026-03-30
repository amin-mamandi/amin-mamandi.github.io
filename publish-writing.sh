#!/usr/bin/env bash

set -euo pipefail

if [ "$#" -ne 1 ]; then
  echo "Usage: ./publish-writing.sh path/to/post.md"
  exit 1
fi

source_file="$1"

if [ ! -f "$source_file" ]; then
  echo "File not found: $source_file"
  exit 1
fi

title_line="$(grep -m1 -E '^# ' "$source_file" || true)"

if [ -n "$title_line" ]; then
  title="${title_line#\# }"
else
  base_name="$(basename "$source_file")"
  title="${base_name%.md}"
  title="$(printf '%s' "$title" | tr '-' ' ')"
fi

slug="$(printf '%s' "$title" \
  | tr '[:upper:]' '[:lower:]' \
  | sed 's/[^a-z0-9]/-/g; s/-\{2,\}/-/g; s/^-//; s/-$//')"

if [ -z "$slug" ]; then
  echo "Could not create a valid slug."
  exit 1
fi

target_file="${slug}.md"
target_path="./${target_file}"
target_url="/writing/${slug}/"

if [ -e "$target_path" ]; then
  echo "Target already exists: $target_path"
  exit 1
fi

body_file="$(mktemp)"
trap 'rm -f "$body_file"' EXIT

awk 'BEGIN{skip=0} /^---[[:space:]]*$/ {skip++; next} skip < 2 {next} {print}' "$source_file" > "$body_file"

if [ ! -s "$body_file" ]; then
  cp "$source_file" "$body_file"
fi

cat > "$target_path" <<EOF
---
layout: default
title: ${title}
permalink: ${target_url}
---

[Home]({{ '/' | relative_url }}) | [Writing]({{ '/writing/' | relative_url }}) | [Photos]({{ '/photos/' | relative_url }})

EOF

cat "$body_file" >> "$target_path"

if ! grep -Fq "${target_url}" writing.md; then
  printf -- "- [%s]({{ '%s' | relative_url }})\n" "$title" "$target_url" >> writing.md
fi

echo "Created ${target_path}"
echo "Added link to writing.md"
