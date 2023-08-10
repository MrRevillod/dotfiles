#!/bin/bash

read -p "Do you want to intall this dotfiles packages? (y/n): " answer
answer=${answer,,}

if [[ $answer == "y" ]]; then

	echo "Installing yay aur helper..."

	cd && git clone https://aur.archlinux.org/yay.git
	cd yay/ && makepkg -si

	echo "Installing apps..."

	# Apps
	sudo pacman -S discord vlc telegram-desktop keepassxc bspwm sxhkd arandr picom polybar nitrogen nautilus lxappeareance eog dunst

	# Services
	# sudo pacman -S bluez bluez-utils

	# Terminal
	sudo pacman -S fish neovim tree lsd unrar htop bat

	# Programming
	sudo pacman -S git nodejs npm python-pip rust jre-openjdk jdk-openjdk alacritty
	curl -sS https://starship.rs/install.sh | sh

    # Fix gtk slow open apps
    sudo pacman -Rndd xdg-desktop-portal xdg-desktop-portal-gtk

	# Fonts
	yay -S ttf-hack-nerd

	# AUR Apps
	yay -S firefox-bin visual-studio-code-bin postman-bin mongodb-bin mongodb-compass drawio-desktop-bin gitkraken

	chsh -s $(which fish)

    cp -r "./Wallpapers/" "$HOME/Pictures/"
    cp -r "./config/fish/" "$HOME/.config/"
    cp -r "./config/nvim/" "$HOME/.config/"
    cp -r "./config/alacritty/" "$HOME/.config/"

    cp -r "./config/bspwm/" "$HOME/.config/"
    cp -r "./config/sxhkd/" "$HOME/.config/"
    cp -r "./config/dunst/" "$HOME/.config/"
    cp -r "./config/nitrogen/" "$HOME/.config/"
    cp -r "./config/polybar/" "$HOME/.config/"

    cp -r "./config/.mozilla//" "$HOME/"
    cp -r "./config/.screenlayout" "$HOME/"

    echo "Finished ..."

elif [[ $answer == "n" ]]; then
	echo "bye ..."
else
	echo "Invalid selection ..."
fi
