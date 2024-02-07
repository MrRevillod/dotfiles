#!/bin/bash

mkdir -p ~/Pictures/
cp -r ./Wallpapers/ ~/Pictures/

mkdir -p ~/.config/
cp -r ./config/.screenlayout/ ~/

cp ../config/.xprofile ~/
cp ../config/wifi.sh ~/

mkdir -p ~/.mozilla/firefox/firefox-themes/

cp -r ./config/firefox/theme/* ~/mozilla/firefox/firefox-themes

directories=(
    "config/alacritty"
    "config/bspwm"
    "config/dunst"
    "config/fish"
    "config/nitrogen"
    "config/nvim"
    "config/picom"
    "config/polybar"
    "config/rofi"
    "config/sxhkd"
)

# Copiando directorios en .config

for dir in "${directories[@]}"; do
    cp -r "./$dir" ~/.config

done

sudo cp ./config/rofi/rounded-gray-dark.rasi /usr/share/rofi/themes/

echo "Finished ... se han copiado las configuraciones"

