#!/bin/bash

### Constants
readonly GIT=".git"

### Functions
function usage() {
  cat << EOF
Usage: $(basename $0) [Options]

Description:
  Script to automate "Adding -> Committing -> Pushing".

Options:
  -h                     Help
EOF

exit 2
}

function eexit() {
  echo -e $1
  exit $2
}

### Main
while getopts :h OPT
do
  case ${OPT} in
    h | *)
      usage
      ;;
  esac
done

if [ ! -e "${GIT}" ]; then
  eexit "There is no .git directory." 2
fi

target_repo=$(basename -s .git $(git remote get-url origin))
target_branch=$(git rev-parse --abbrev-ref HEAD)
untracked_files=$(git status -s)
if [ -z "${untracked_files}" ]; then
  eexit "Nothing to add." 1
fi

cat << EOF
[Target repository]
${target_repo}

[Target branch]
${target_branch}

[Untracked files]
${untracked_files}

[Commit message]
EOF

read commit_message

cat << EOF

Q. DO YOU WANNA ADD, COMMIT and PUSH ? [y/n]
EOF

read ans
if [ "${ans}" != "y" ] && [ "${ans}" != "Y" ]; then
  eexit "\nTerminated." 1
fi

staged_files=$(git add . > /dev/null; git status -s)
commit_output=$(git commit -m "${commit_message}")

cat << EOF

[Staged files]
${staged_files}

[Commit log]
${commit_output}
EOF

push_output=$(git push origin "${target_branch}" 2>&1)

cat << EOF

[Push log]
${push_output}

Completed.
EOF