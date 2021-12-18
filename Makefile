install:
	chmod u+x check_for_uncommited_changes.sh
	mkdir -p "${HOME}/.local/bin"
	ln -sf "`pwd`/check_for_uncommited_changes.sh" "${HOME}/.local/bin/git-uncomitted"
	ln -sf "`pwd`/check_for_uncommited_changes.sh" "${HOME}/.local/bin/gu"
uninstall:
	rm -f "${HOME}/.local/bin/git-uncomitted"
	rm -f "${HOME}/.local/bin/gu"
