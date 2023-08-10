#!/bin/bash

read -p "Do you want to execute the commands? (y/n): " answer
answer=${answer,,}

# Verify the answer
if [[ $answer == "y" ]]; then

	echo "Executing the commands..."

	# copying wallpapers
	cp -r ./Wallpapers/ ~/Pictures/

	# cp .local/share directories
	cp -r ./local/extensions/ ~/.local/share/gnome-shell/

	# cp .config/ directories
	cp ./config/.gtkrc-2.0 ~/
	cp -r ./config/gtk-3.0/ ~/.config/
	cp -r ./config/ulauncher/ ~/.config/

	# clone and install vinceliuice WhiteSur themes
	cd && git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git
	cd WhiteSur-gtk-theme/

	./install.sh && ./install.sh -l

	echo "Base theme installed.."

	./tweaks.sh -F && sudo flatpak override --filesystem=xdg-config/gtk-4.0
	./tweaks.sh -f monterey

	echo "Flatpak and Firefox theme installed"

	# Clone and install WhiteSur icon and cursor theme
	cd && git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git
	cd WhiteSur-icon-theme/

	./install.sh && ./install.sh -b

	cd && git clone https://github.com/vinceliuice/WhiteSur-cursors.git
	cd WhiteSur-cursors/

	./install.sh

	echo "Icons and cursors installed"
	echo "The commands have been executed successfully."

	read -p "Do you want to use this set up extension config? (y/n)" ext_answer
	ext_answer=${ext_answer,,}

	if [[ $ext_answer == "y" ]]; then
		dconf load / <./config/dconf/ext-dconf.txt
		echo "Custom extension conf will be installed ..."
	else
		echo "Default extension conf will be used ..."
	fi

	read -p "Do you want to set the icons and themes now? (y/n)" themes_answer
	themes_answer=${themes_answer,,}

	if [[ $themes_answer == "y" ]]; then
		dconf load / <./config/dconf/ui-dconf.txt
		echo "Tweaks are done ..."
	else
		echo "you'll need to set the themes by yourself ..."
	fi

	read -p "Do you want to set extras and keybindings now? (y/n)" extra_answer
	extra_answer=${themes_answer,,}

	if [[ $extra_answer == "y" ]]; then
		dconf load / <./config/dconf/keybdgs-dconf.txt
		echo "Tweaks are done ..."
	else
		echo "you'll need to set the themes by yourself ..."
	fi

	# Prompt to restart
	read -p "Do you want to restart your system now? (y/n): " restart_answer
	restart_answer=${restart_answer,,}

	if [[ $restart_answer == "y" ]]; then
		sudo reboot
	else
		echo "Please restart your system to apply the changes."
	fi

elif [[ $answer == "n" ]]; then
	echo "The commands will not be executed."
else
	echo "Invalid response. The commands will not be executed."
fi
