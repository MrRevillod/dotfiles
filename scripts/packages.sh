#!/bin/bash

echo "Installing yay aur helper..."

cd && git clone https://aur.archlinux.org/yay.git
cd yay/ && makepkg -si

echo "Installing apps as sudo..."

sudo pacman -S discord vlc telegram-desktop keepassxc bspwm sxhkd arandr picom polybar nitrogen nautilus lxappeareance eog dunst rofi

# Services (optional)
sudo pacman -S pulseaudio-alsa

# Terminal
sudo pacman -S fish neovim tree lsd unrar htop bat xclip

# Programming
sudo pacman -S git nodejs npm python-pip rust jre-openjdk jdk-openjdk alacritty
curl -sS https://starship.rs/install.sh | sh

# Fix gtk slow open apps
sudo pacman -Rndd xdg-desktop-portal xdg-desktop-portal-gtk

# Fonts
sudo pacman -S adobe-source-han-sans-jp-fonts
yay -S ttf-hack-nerd 

# AUR Apps
yay -S firefox-bin visual-studio-code-bin postman-bin mongodb-bin mongodb-compass drawio-desktop-bin gitkraken

echo "Packages installation finished ..."
