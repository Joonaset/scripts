# Readme

This repo contains bash scripts

## bitwarden.sh

Use this with qutebrowser. Fetches password for page you are currently on and stores it in clipboard for 10 seconds. Requires [bitwarden-cli](https://raw.githubusercontent.com/Argetlami/scripts/master/bash/section-upload?token=AIWCPW2GU43JJ3KXJGELWJS64JURO)
and [dmenupass](https://raw.githubusercontent.com/Argetlami/scripts/master/bash/section-upload?token=AIWCPW2GU43JJ3KXJGELWJS64JURO)
place or link script file in .local/bin/qutebrowser/userscripts and call in qutebrowser with `spawn --userscript bitwarden.sh`

TODO add verbosity and error catching

## networkcheck.sh

Checks if computer is connected in home network, updates crontab to use home.sh or away.sh

## home.sh

Use wallpapers from nsfw folder ;)

## sfw.sh

Use wallpapers from sfw folder

## maven.sh

Search upwards for pom.xml and run maven using it. I don't use this anymore as I am emacs user now.

## gitpuller.sh

Automate pulling repos.

## wprandomizer

Set two random wallpapers from different folders as `feh --bg-scale --randomize dir1/* dir2/*` produces strange errors every once in a while.

## sxbg

Meant to be used with sxiv key handler. Reads file directory and sets wallpaper on correct monitor. (I have monitors in landscape and portrait rotations)

## mpdrandom.py

Shuffles current mpd playlist by albums. If album info empty, uses artist name instead of album. Requires python-musicpd.
