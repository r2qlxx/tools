#!/bin/bash

### Constants
readonly GIT=".git"

### Functions
function usage() {
  cat << EOF
Usage: $(basename $0) [Options]

Description:
  Script to automate "Adding, Committing, Pushing".

Options:
  -m <Commit Message>    Set commit message.
                         Empty message is unacceptable.
  -h                     Help
EOF

exit 2
}

function eexit() {
  echo $1
  exit $2
}

### Main
while getopts :m:h OPT
do
  case ${OPT} in
    m)
      message=${OPTARG}
      ;;
    h | *)
      usage
      ;;
  esac
done

if [ -z "${message}" ]; then
  usage
fi

if [ ! -e "${GIT}" ]; then
  eexit "There is no .git directory." 2
fi

target_repo=$(basename -s .git $(git remote get-url origin))
target_branch=$(git rev-parse --abbrev-ref HEAD)
target_files=$(git status -s)
if [ -z "${target_files}" ]; then
  eexit "Nothing to add." 1
fi

cat << EOF
[Target Repository]
${target_repo}

[Target Branch]
${target_branch}

[Untracked Files]
${target_files}

Q. DO YOU WANNA ADD, COMMIT and PUSH ? [y/n]
EOF

echo -n "A. "
read ans
if [ "${ans}" != "y" ]; then
  eexit "Terminated." 1
fi

git add . > /dev/null
git_commit=$(git commit -m "${message}")

cat << EOF

[Adding]
${target_files}

[Committing]
${git_commit}

[Pushing]
EOF

# To improve the appearance of the output results, this process is not included in the above process.
git_push=$(git push origin "${target_branch}")

echo -e "\nCompleted."
