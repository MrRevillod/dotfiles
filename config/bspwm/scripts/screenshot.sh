#!/bin/bash

option0='screen'
option1='select area or window'
option2='currently focused window'
options="$option0\n$option1\n$option2"

screenshot_folder="$HOME/Pictures/Screenshots"
mkdir -p "$screenshot_folder"
file="$screenshot_folder/screenshot-$(date +%F_%T).png"

selected="$(echo -e "$options" | rofi -lines 3 -dmenu -p 'scrot')"
case $selected in
  "$option0")
    sleep 1 && gnome-screenshot -f "$file";;
  "$option1")
    sleep 1 && gnome-screenshot -acf /tmp/my-screenshot && cat /tmp/my-screenshot | xclip -i -selection clipboard -target image/png;;
  "$option2")
    sleep 1 && gnome-screenshot -w -f "$file";;
esac
