#!/bin/bash

PLUGINS_FILE="$HOME/asdf-plugins.txt"
PLUGIN_VERSIONS_FILE="$HOME/asdf-plugin-versions.txt"
TOOL_VERSIONS_FILE="$HOME/asdf-tool-versions.txt"

# Install plugins
while read plugin; do
  # Trim leading/trailing whitespace
  plugin=$(echo "$plugin" | xargs)
  if [ -n "$plugin" ]; then
    echo "Adding plugin: $plugin"
    asdf plugin add "$plugin" || echo "Plugin $plugin already exists or couldn't be added"
  fi
done < "$PLUGINS_FILE"

# Install versions
while IFS= read -r line; do
  # Parse the line (format: plugin:version)
  IFS=':' read -r plugin version <<< "$line"
  
  if [ -n "$plugin" ] && [ -n "$version" ]; then
    # Trim whitespace
    plugin=$(echo "$plugin" | xargs)
    version=$(echo "$version" | xargs)
    
    echo "Installing $plugin version $version"
    asdf install "$plugin" "$version" || echo "Failed to install $plugin $version"
  fi
done < "$PLUGIN_VERSIONS_FILE"

while IFS= read -r line; do
    if [[ $line == FILE:* ]]; then
        file_path="${line#FILE:}"
        mkdir -p "$(dirname "$file_path")"
        > "$file_path"
    elif [[ $line == END ]]; then
        continue
    else
        echo "$line" >> "$file_path"
    fi
done < "$TOOL_VERSIONS_FILE"

echo "asdf environment restored!"
