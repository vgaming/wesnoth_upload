luacheck_ignore="${luacheck_ignore:-false}"
luacheckrc="${luacheckrc:-.build/.luacheckrc}"
luacheck_binary="${luacheck_binary:-luacheck}"

uncommitted_ignore="${uncommitted_ignore:-false}"
not_pushed_ignore="${not_pushed_ignore:-false}"

declare -F description 1> /dev/null || description() {
  cat src/doc/about.txt
}
declare -F passphrase 1> /dev/null || passphrase() {
  if ! test -f .build/.passphrase; then
    echo "$RANDOM$RANDOM$RANDOM$RANDOM" >> .build/.passphrase
  fi
  cat .build/.passphrase
}

upload_to_wesnoth_versions=(1.14) # (1.14 1.15)
addon_manager_args=()
