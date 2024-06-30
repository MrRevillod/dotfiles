#!/bin/bash

echo "Installing yay aur helper..."

cd && git clone https://aur.archlinux.org/yay.git
cd yay/ && makepkg -si

echo "Installing apps as sudo..."

# Desktop packages
sudo pacman -S bspwm sxhkd arandr picom polybar nitrogen dunst rofi gnome-screenshot

# Applications
sudo pacman -S discord vlc telegram-desktop keepassxc nautilus lxappearance eog flatpak

# Terminal
sudo pacman -S fish neovim tree lsd unrar unzip htop bat xclip python-pip

# Programming
sudo pacman -S git nodejs npm pnpm rust alacritty mysql
curl -sS https://starship.rs/install.sh | sh

# Fix gtk slow open apps
sudo pacman -Rndd xdg-desktop-portal

# Fonts
sudo pacman -S adobe-source-han-sans-jp-fonts
yay -S ttf-hack-nerd apple-fonts

# AUR Apps
yay -S firefox-bin vscodium-bin-marketplace mongodb-bin mongodb-compass
echo "Packages installation finished ..."
