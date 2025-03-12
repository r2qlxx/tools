#!/bin/bash

### Constants
readonly NOTE_DIR="${HOME}/workspace/note"
readonly NOTE_EXT=".txt"

### Functions
function eexit() {
  echo $1
  exit $2
}

### Main
timestamp_today=$(date +"%Y%m%d")
note_file="${NOTE_DIR}/${timestamp_today}${NOTE_EXT}"

if [ ! -e ${note_file} ]; then
    touch ${note_file}
else
    eexit "Already exists." 0
fi