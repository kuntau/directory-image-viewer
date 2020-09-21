#!/usr/bin/env bash

INDEX_PATH='/HQPOOL/DATA/Coding/directory-image-viewer/index.html'
echo $INDEX_PATH

echo "Checking requirements..."
hash fd 2>/dev/null || { echo >&2 "I require fd but it's not installed.  Aborting."; exit 1; }
hash find 2>/dev/null || { echo >&2 "I require find but it's not installed.  Aborting."; exit 1; }
echo "All requirements met"

# argn=$#
# echo $1

# result=$(fd . --type d --print0 "$1")
result=$(fd . --type d "$1")
# touch $result
# fd . --type d $1 | xargs echo
# echo $arg1
# i=0

# echo ${#result}

IFS=$'\n'
for i in $result; do
  # check if folder have files
  file=$(fd . --type f --max-depth 1 $i)
  if [ ${#file} -eq 0 ]; then
    echo equal zero
  else
    ln -s $INDEX_PATH $i/index.html
    echo ${#file[@]} :: $i/index.html
  fi
done

