#!/bin/bash

mkdir -p ~/dotfiles/config

directories=(
    "alacritty"
    "bspwm"
    "dunst"
    "fish"
    "nitrogen"
    "nvim"
    "picom"
    "polybar"
    "rofi"
    "sxhkd"
)

for dir in "${directories[@]}"; do
    cp -r "$HOME/.config/$dir" ~/dotfiles/config
done

cp -r "$HOME/Pictures/Wallpapers" ~/dotfiles/

echo "Finished"

