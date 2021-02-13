luacheck_ignore=false
luacheckrc='.build/.luacheckrc'
luacheck_binary='luacheck'

uncommitted_ignore=false
not_pushed_ignore=true

description() {
	cat src/doc/about.txt
}
passphrase() {
	cat .build/.passphrase
}

upload_to_wesnoth_versions=(1.14) # (1.14 1.15)
addon_manager_args=()
