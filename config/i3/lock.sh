#!/bin/bash
icon="$HOME/.config/i3/i3lock_blur/lock.png"
# create a temp file
img=$(mktemp /tmp/XXXXXXXXXX.png)
# Take a screenshot of current desktop
import -window root $img 
# Pixelate the screenshot
convert $img -scale 10% -scale 1000% $icon -gravity center -composite $img
# Alternatively, blur the screenshot (slow!)
#convert $img -blur 2,5 $icon -gravity center -composite $img
# Add the lock image
#convert $img $icon -gravity center -composite $img
# Run i3lock with custom background
i3lock -i $img
# Remove the tmp file
rm $img
