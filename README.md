## wesnoth_upload -- uploading add-ons made easy

This repo is a set of developer practices and a shell script that makes uploading wesnoth add-ons easier.

It intends to replace the following steps:

* Make sure you have no uncommitted changes before you make a new release.
* Increase the version number in _server.pbl
* If you show version inside the add-on itself (WML), copy-paste it.
* Make sure you copy-pasted description between scenario/modification and _server.pbl (if they are in sync, commonly they are).
* Make sure you didn't forget to check your Lua code before doing a release (`luacheck`)
* Make sure you didn't forget to `git tag` each release you make. Otherwise you won't remember what you had in release X.Y.Z after a few days/hours/releases.
* Start wesnoth-1.12, open add-ons, find your add-on, click upload.
* If you also use wesnoth-1.13, repeat it once again.

## How does it work

It combines the steps above presuming you follow certain conventions:

* you develop in git
* you want each of your releases to be uniquely associated with a git tag

[wesnoth_upload](./wesnoth_upload) is the script that does the rest.

## Get started

1. Copy the files from [skeleton](./skeleton) dir to your project.
1. Remove "passphrase" from `_server.pbl` and copy the password itself to `.build/.passphrase`.
1. Remove "description" from `_server.pbl` and copy the description itself to `doc/about.txt`.
1. Remove "version" from `_server.pbl`.
1. Optionally, put `_server.pbl` in git as it no longer contains the passphrase.
1. Specify wesnoth versions your add-on is compatible with (1.12 and 1.13 by default).
1. Commit your changes.
1. Presuming you want to upload version `X.Y.Z`, execute this in your project dir:
`wesnoth_upload "X.Y.Z"`

You may re-configure the steps above in `.build/config.sh`. You may f.e. use a different passphrase generation command if you like. Or change how "description" is generated: maybe it's generated from a pandoc markup by stripping all tags? I use that personally.

## Examples
The following add-ons also use this script:

* https://github.com/vgaming/afterlife
* https://github.com/vgaming/berserk_limiter
* https://github.com/vgaming/CreepWars
* https://github.com/vgaming/gold_per_village

(Write me if you'd like your add-on to be listed here.)
