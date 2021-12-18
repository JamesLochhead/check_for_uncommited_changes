#!/usr/bin/env bash

git_repo_path="$HOME/Git/"

cd "$git_repo_path" || {
	echo "Failed to cd to $git_repo_path"
	exit 1
}

git_status_porcelain() {
	if git status --porcelain | egrep ".*" 2>&1 > /dev/null; then
		pwd
	fi
}

export -f git_status_porcelain

readarray -d '' git_repos < <(find "$git_repo_path" -maxdepth 1 -mindepth 1 -type d -print0)

uncommited_git_repos=$(for directory in "${git_repos[@]}"
do
	cd $directory
	if [ -d .git ]; then
		git_status_porcelain
	fi

done)

if echo "$uncommited_git_repos" | egrep "[^[:space:]]" 2>&1 > /dev/null; then
	printf '\nThe following repositories have uncommited changes:'
	printf "\n\n$uncommited_git_repos\n\n"
	exit 2
fi
