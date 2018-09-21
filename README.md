## About

`wesnoth_upload` is a shell script that makes wesnoth add-on maintenance easier.

## Example

```
  wesnoth_upload --minor
```

This command replaces the following steps:

* Make sure you have no uncommitted changes before you make a new release.
* Increase the version number in _server.pbl.  In this example, the "minor" component of semver version is increased, e.g. 3.6.12 -> 3.7.0
* If your add-on version is shown somewhere in WML, copy-paste it there.
* Copy-paste _server.pbl description somewhere into WML, if they are in sync (they are often duplicated).
* Run `luacheck` on your code if you use lua files.
* `git tag` your commit with exactly the same version you used in _server.pbl. This may help debugging later a lot. Otherwise you won't remember what you had in release X.Y.Z after a few days/hours/releases.
* Start wesnoth, open add-ons, find your add-on, click upload.
* If you also use a development wesnoth version, repeat last step there as well.

## How does it work

It combines the steps above presuming you follow certain conventions:

* you develop in git
* you want each release to be uniquely associated with a git tag

## Get started

1. Copy the files from [skeleton](./skeleton) dir to your project.
1. Remove "passphrase" from `_server.pbl` and copy the value to `.build/.passphrase`.
1. Remove "description" from `_server.pbl` and copy the value to `doc/about.txt`.
1. Remove "version" from `_server.pbl`.
1. Optionally, put `_server.pbl` in git as it no longer contains the passphrase.
1. Specify wesnoth versions your add-on is compatible with (1.14 by default).
1. Commit your changes.
1. Presuming you want to upload version `X.Y.Z`, execute this in your project dir:
`wesnoth_upload "X.Y.Z"`
1. Later, once you have at least one git tag present in your repo, you can use `wesnoth_upload --patch`, `wesnoth_upload --minor` and `wesnoth_upload --major` to bump the version numbers automatically.

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
