#!/bin/bash

# check filename
if [ $# -ne 1 ]; then
  echo "update the file"
  exit 1
fi

file="$1"
temp="$(mktemp)"
line=0

while IFS= read -r current || [ -n "$current" ]; do
  line=$((line + 1))
  echo "line $line: $current"

  # Check lowercase or uppercase 
  check=$(echo "$current" | tr '[:upper:]' '[:lower:]')

  if [ $line -ge 5 ] && [[ "$check" == *welcome* && "$check" == *give* ]]; then
    echo "  -> changing 'give' to 'learning'"
    current="${current//give/learning}"
  fi

  echo "$current" >> "$temp"
done < "$file"

mv "$temp" "$file"
echo "Output: $file"





