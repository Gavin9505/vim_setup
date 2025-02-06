#!/bin/bash

PROJECT_ROOT="${1:-$(pwd)}"
EXTENSIONS=("c" "cpp" "py" "vimrc" "shellcheck" "h")
FILE_LIST=$(mktemp)
OUTPUT_FILE_PATH="$PWD/tags"

mkdir "$OUTPUT_FILE_PATH"

find "$PROJECT_ROOT" -type f \( -name "*.${EXTENSIONS[0]}" $(for ext in "${EXTENSIONS[@]:1}"; do echo -o -name "*.$ext"; done) \) > "${FILE_LIST}"

echo "Generating ctags..."
ctags -R --languages=C,C++,Python,Vim, --fields=+l --extra=+q -L "${FILE_LIST}" -f "${OUTPUT_FILE_PATH}/tags" 

echo "Generating cscope..."
cscope -RCbqk -f "${OUTPUT_FILE_PATH}/cscope.out" -i "${FILE_LIST}"

rm "$FILE_LIST"

echo "cscope and ctags generation complete."
