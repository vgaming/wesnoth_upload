######## misc settings:

#### Normally, you won't be able to upload uncommitted changes
#### Set to true to ignore the check.
#uncommitted_ignore=false

#### Normally, you can't upload a version that is not pushed anywhere
#### Set to true to ignore the check.
#not_pushed_ignore=false


######## luacheck settings:

#### Normally, `luacheck` will be run on your Lua code to find possible problems.
#### Set to true to ignore the check.
#luacheck_ignore=false

#### If luacheck is not in your PATH, override this.
#### You may use a full address like /path/to/your/luacheck
#luacheck_binary='luacheck'

#### Uncomment this if you want to use a custom location for .luacheckrc file
#luacheckrc='.build/.luacheckrc'


######## _server.pbl keys:

#### If you want a custom version generator (not git tag), uncomment and override this method
#version() { echo ''; }

#### If you want a custom description to be put in _server.pbl, override this method
#description() { echo ''; }

#### If you want to use a different passphrase, override this method
#passphrase() { echo ''; }


######## uploading settings:

#### Which wesnoth versions to upload to?
#upload_to_wesnoth_versions=(1.12 1.13)

#### If you want to use a custom uploading script, override this method
#upload() { true; }
