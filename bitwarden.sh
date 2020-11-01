#!/bin/bash
# TODO checks and options for external programs
URL=$(echo "$QUTE_URL" | awk -F[/:] '{print $4}')
notify-send "Fetching password for $URL"

mpw=$(dmenupass "Master Password")
session=$(bw unlock "$mpw" --raw) || notify-send "Wrong password" && exit 0
pass=$(bw get password "$URL" --session "$session") &&
echo "$pass" | xsel -b -t 10000 || exit 1

notify-send -t 10000 "Password Copied to clipboard"
