#!/bin/bash -eu
set -o pipefail
{

#### check arguments
if test "$#" != 1; then
	>&2 echo "ERROR. Invalid number of arguments. Usage $0 <TAG_NAME>"
	exit 1
fi
tag="$1"


#### default settings:
luacheckrc='.build/.luacheckrc'
luacheck_binary='luacheck'
luacheck_ignore=false

uncommitted_ignore=false
not_pushed_ignore=false

version() {
	mkdir -p target
	git describe --tags | cut -d '-' -f -2 | tr -d '\n' | tee target/version.txt
	cat target/version.txt | tr '.-' '__' > target/version_nodot.txt
}
description() {
	cat doc/about.txt
}
passphrase() {
	cat .build/.passphrase
}

upload_to_wesnoth_versions=(1.12 1.13)
upload() {
	#dir_name="$(basename "$(realpath .)")"
	#--upload ~/.local/share/wesnoth/1.13/data/add-ons/"$dir_name"
	for ver in "${upload_to_wesnoth_versions[@]}"; do
		wesnoth_addon_manager --port "$ver.x" \
			--pbl-key "version" "$(version)" \
			--pbl-key "description" "$(description)" \
			--pbl-key "passphrase" "$(passphrase)" \
			--upload .
	done
}


#### source user config
if ! source .build/config.sh; then
	>&2 echo "ERROR. Could not source .build/config.sh"
	exit 1
fi


#### use luacheck to find possible problems in Lua code
readarray -td '' all_lua_files < <(find . -name '*.lua' -print0)
if test "${#all_lua_files[@]}" -ne 0; then
	if test "${luacheck_ignore:-}" = "true"; then
		true
	elif ! which "$luacheck_binary" >/dev/null 2>&1; then
		>&2 echo "WARNING. $luacheck_binary binary not found." \
			"Could not check your lua files." \
			"You can disable luacheck by setting luacheck_ignore=true"
	elif ! test -f "$luacheckrc"; then
		>&2 echo "WARNING: $luacheckrc not found. " \
			"Could not check your lua files. " \
			"You can disable luacheck by setting luacheck_ignore=true"
	else
		${luacheck_binary} "${all_lua_files[@]}" \
			--globals wesnoth wml --std max \
			--config "$luacheckrc"
	fi
fi


#### only upload clean git directory, no uncommitted changes
if ! test -z "$(git status --porcelain)" && test "${uncommitted_ignore:-}" != "true" ; then
	>&2 echo "ERROR. You have uncommitted changes." \
		"You can disable this check by setting uncommitted_ignore=true"
	exit -1
fi


#### only publish commits that you actually pushed anywhere
if test "${not_pushed_ignore:-}" != "true" &&
	! test "$(git rev-parse HEAD)" = "$(git rev-parse '@{u}')"
then
	>&2 echo "ERROR. git push first!" \
		"You can disable this check by setting not_pushed_ignore=true"
	exit 1
fi


#### create a git tag for each upload
git tag "$tag"
trap 'git tag --delete "$tag"' ERR

#### upload
upload


}; exit 0