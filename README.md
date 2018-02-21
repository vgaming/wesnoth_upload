## wesnoth_publish -- publishing add-ons made easy

This repo is a set of developer practices and a shell script that makes publishing wesnoth add-ons easier.

It intends to replace the following steps:

* Make sure you have no uncommitted changes before you make a new release
* Increase the version number in _server.pbl
* Make sure you copy-pasted description between scenario/modification and _server.pbl (if they are in sync, commonly they are).
* Make sure you didn't forget to check your Lua code before doing a release (`luacheck`)
* Make sure you didn't forget to `git tag` each release you make. Otherwise you won't remember what you had in release X.Y.Z after a few days/hours/releases.
* Start wesnoth-1.12, open add-ons, find your add-on, check you increased version, click publish.
* If you use wesnoth-1.13, do all of the steps above for this wesnoth version.

## How does it work

It combines the steps above presuming you follow certain conventions:

* you develop in git
* you want each of your releases to be uniquely associated with a git tag

Check out the main script `wesnoth_publish.sh` if in doubts.

## Get started

See the [skeleton](./skeleton) dir an example of a directory layout you'll have to use.

Copy these files to your add-on and launch `wesnoth_publish.sh`. Ideally, the script will report all problem it sees, or it can just work out of the box if you do not need any changes to `_server.pbl`.

## Examples
The following add-ons use this script and may be considered examples:

* https://github.com/vgaming/afterlife
* https://github.com/vgaming/berserk_limiter

(Write me if you'd like your add-on to be listed here.)
