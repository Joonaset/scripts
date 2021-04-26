#!/bin/bash
# TODO checks and options for external programs
URL=$(echo "$QUTE_URL" | awk -F[/:] '{print $4}')
notify-send "Fetching password for $URL"

mpw=$(dmenupass "Master Password")
session=$(bw unlock "$mpw" --raw) || notify-send "Wrong password"
username=$(bw get username "$URL" --session "$session")
pass=$(bw get password "$URL" --session "$session") &&

# Implementing fake-key to enter fetched info on page
echo "fake-key $username" >> "$QUTE_FIFO"
echo "fake-key <Tab>" >> "$QUTE_FIFO"
echo "fake-key $pass" >> "$QUTE_FIFO"
