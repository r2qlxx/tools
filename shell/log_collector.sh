#!/bin/bash

cd $(dirname $(readlink -f $0))

### Constants
readonly bkup_dir="bkup_lc"
readonly output_dir="output_lc"
readonly target_files=(
  # Write target log files here.
  "/home/admin/a.log"
  "/home/admin/b.log"
  "/home/admin/c.log"
)

### Functions
function eexit() {
  echo $1
  exit $2
}

function main() {
  if [ ! -e ${bkup_dir} ]; then

    mkdir -p ${bkup_dir}

    for file in ${target_files[@]}
    do
      if [ -e ${file} ]; then
        cp -p ${file} ${bkup_dir}
      else
        filename=$(basename ${file})
        touch ${bkup_dir}/${filename}
      fi
    done

  else

    now=$(date "+%Y%m%d%H%M%S")
    log_dir=${output_dir}/${now}
    mkdir -p ${log_dir}

    for file in ${target_files[@]}
    do
      if [ ! -e ${file} ]; then
        continue
      fi

      filename=$(basename ${file})
      diff --old-line-format='' --unchanged-line-format='' --new-line-format='%L' \
      ${bkup_dir}/${filename} ${file} > ${log_dir}/${filename}
    done

    rm -rf ${bkup_dir}

  fi
}

### Main
main
