#!/usr/bin/env bash

git_repo_path="$HOME/Git"

cd "$git_repo_path" || {
	echo "Failed to cd to $git_repo_path"
	exit 1
}

git_status_porcelain() {
	cd "$1"
	cd ..
	if git status --porcelain | egrep ".*" 2>&1 > /dev/null; then
		pwd
	fi
}

export -f git_status_porcelain

output=$(find . -maxdepth 2 -type d -path "*.git*" -execdir bash -c 'git_status_porcelain "$0"' {} \;)

if echo "output" | egrep ".*" 2>&1 > /dev/null; then
	printf '\nThe following repositories have uncommited changes:'
	printf "\n\n$output\n\n"
	exit 2
fi
