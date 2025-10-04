#!/bin/bash

PLUGINS_FILE="$HOME/asdf-plugins.txt"
PLUGIN_VERSIONS_FILE="$HOME/asdf-plugin-versions.txt"
TOOL_VERSIONS_FILE="$HOME/asdf-tool-versions.txt"

# Initialize files (overwrite any existing files)
> "$PLUGINS_FILE"
> "$PLUGIN_VERSIONS_FILE"
> "$TOOL_VERSIONS_FILE"

# Get plugins once and process them for both files
plugins=$(asdf plugin list)

for plugin in $plugins; do
  # Add to plugins file
  echo "$plugin" >> "$PLUGINS_FILE"
  
  # Get versions and format them with plugin name prefix
  versions=$(asdf list $plugin)
  while IFS= read -r version; do
    # Trim whitespace and check if not empty
    trimmed=$(echo "$version" | xargs)
    if [ -n "$trimmed" ]; then
      # Remove asterisk if present
      clean_version=$(echo "$trimmed" | sed 's/^\*//' | xargs)
      echo "$plugin:$clean_version" >> "$PLUGIN_VERSIONS_FILE"
    fi
  done <<< "$versions"
done

# Find all .tool-versions files and save their paths and contents
find "$HOME" -name ".tool-versions" -type f | while read -r file; do
    echo "FILE:$file" >> "$TOOL_VERSIONS_FILE"
    cat "$file" >> "$TOOL_VERSIONS_FILE"
    echo "END" >> "$TOOL_VERSIONS_FILE"
done

echo "asdf backup complete!"
