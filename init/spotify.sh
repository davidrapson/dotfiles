#!/usr/bin/env bash
# Add Spotify to Notification so we can disable badge icons.

set -e

# "Usernoted" seems to be the "user notifications daemon", so get it's PID.
pid=$(ps aux | grep -i [u]sernoted | awk '{print $2}')

# Find the sqlite3 database that this program has open. It's in a "private" folder (app sandboxing).
db="$(lsof -p $pid | grep com.apple.notificationcenter/db/db\$ | awk '{print $9}')"

# I got the bundleid from Spotify.app/Contents/Info.plist
bundleid="com.spotify.client"

# I use 0 as the flags because you can change all the settings in System Preferences
# 5 seems to be the default for show_count
# Grab the next-highest sort order
sql="INSERT INTO app_info (bundleid, flags, show_count, sort_order) VALUES ( '$bundleid', 0, 5, (SELECT MAX(sort_order) + 1 FROM app_info) );"

# Run the command
sqlite3 "$db" "$sql"

# Restart usernoted to make the changes take effect
killall usernoted
