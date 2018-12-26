## About

`wesnoth_upload` is a shell script that makes wesnoth add-on maintenance easier.

## Example

```
  wesnoth_upload --minor
```

This command replaces the following steps:

* Make sure you have no uncommitted changes before you make a new release.
* Increase the version number in _server.pbl.  In this example, the "minor" component of semver version is increased, e.g. 3.6.12 -> 3.7.0
* If your _server.pbl version is shown somewhere in WML, copy-paste it there.
* If your _server.pbl description is shown somewhere in WML, copy-paste it.
* Run `luacheck` on your code if you use lua files.
* `git tag` your commit with exactly the same version you used in _server.pbl. This may help debugging later a lot. Otherwise you won't remember what you had in release X.Y.Z after a few days/hours/releases.
* Start wesnoth, open add-ons, find your add-on, click upload.
* If you also use a development wesnoth version, repeat last step there as well.

## How does it work

It combines the steps above presuming you follow certain conventions:

* you develop in git
* you want each release to be uniquely associated with a git tag

## Get started

* Copy the files from [skeleton](./skeleton) dir to your project.
* Rename "your_addon_name" dir to your real add-on name
* Run `ln -s your_real_addon_name src`. (Symlink from src/ to the new dir.)
* Move _server.pbl, all Lua and WML files into src/.
* Remove "passphrase" from `_server.pbl` and copy the value to `.build/.passphrase`.
* Remove "description" from `_server.pbl` and copy the value to `doc/about.txt`.
* Remove "version" from `_server.pbl`.
* Optionally, put `_server.pbl` in git as it no longer contains the passphrase.
* Optionally, specify wesnoth versions your add-on is compatible with (1.14 by default).
* Commit your changes.
* Once you have at least one git tag present in your repo, use `wesnoth_upload --patch`, `wesnoth_upload --minor` or `wesnoth_upload --major` to upload the add-on. If you do not have a git tag yet or if you'd like to use a custom version, use "X.Y.Z" istead of "--patch"/"--minor"/"--major".

You may re-configure the steps above in `.build/config.sh`. You may f.e. use a different passphrase generation command if you like. Or change how "description" is generated.

If you need more or less built-in functionality and would like to discuss that, feel free to contact me on IRC (vn971 on #wesnoth-umc-dev).

## Examples
The following add-ons use this script:

* https://github.com/vgaming/afterlife
* https://github.com/vgaming/pick_advance
* https://github.com/vgaming/berserk_limiter
* https://github.com/vgaming/CreepWars
* https://github.com/vgaming/gold_per_village
* https://github.com/vgaming/mirror_faction
* https://github.com/vgaming/science

(Write me if you'd like your add-on to be listed here.)
