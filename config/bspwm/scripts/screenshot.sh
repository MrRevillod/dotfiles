#!/bin/bash

# options to be displayed
option0='screen'
option1='select area or window'
option2='currently focused window'
options="$option0\n$option1\n$option2"

# save file
file="$(xdg-user-dir PICTURES)/screenshot-$(date +%F_%T).png"

selected="$(echo -e "$options" | rofi -lines 3 -dmenu -p 'scrot')"
case $selected in
  "$option0")
    sleep 1 && gnome-screenshot -f "$file";;
  "$option1")
    sleep 1 && gnome-screenshot -acf /tmp/my-screenshot && cat /tmp/my-screenshot | xclip -i -selection clipboard -target image/png;;
  "$option2")
    sleep 1 && gnome-screenshot -w -f "$file";;
esac