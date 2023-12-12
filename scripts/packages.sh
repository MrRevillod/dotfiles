#!/bin/bash

echo "Installing yay aur helper..."

cd && git clone https://aur.archlinux.org/yay.git
cd yay/ && makepkg -si

echo "Installing apps as sudo..."

# Desktop packages
sudo pacman -S bspwm sxhkd arandr picom polybar nitrogen dunst rofi gnome-screenshoot

# Applications
sudo pacman -S discord vlc telegram-desktop keepassxc nautilus lxappeareance-gtk3 eog virtualbox linux-headers flatpak

# Terminal
sudo pacman -S fish neovim tree lsd unrar unzip htop bat xclip

# Programming
sudo pacman -S git nodejs npm pnpm rust alacritty
curl -sS https://starship.rs/install.sh | sh

# Python libraries
sudo pacman -S python-pip python-scipy python-numpy python-pygame python-numba python-matplotlib python-pillow

# Fix gtk slow open apps
sudo pacman -Rndd xdg-desktop-portal

# Fonts
sudo pacman -S adobe-source-han-sans-jp-fonts
yay -S ttf-hack-nerd apple-fonts

# AUR Apps
yay -S firefox-bin vscodium-bin-marketplace mongodb-bin mongodb-compass drawio-desktop-bin
echo "Packages installation finished ..."
