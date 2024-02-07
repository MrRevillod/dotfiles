
#!/bin/bash

# WhiteSur installation script

# Set HOME
BASE_DIR="$HOME"

install() {
    local repo_url="$1"
    local repo_dir="$2"
    git clone "$repo_url" "$BASE_DIR/$repo_dir"
    cd "$BASE_DIR/$repo_dir"
    chmod +x ./install.sh
    ./install.sh
}

# Install vinceliuice WhiteSur-cursors
install "https://github.com/vinceliuice/WhiteSur-cursors.git" "WhiteSur-cursors"

# Install vinceliuice WhiteSur-icons
install "https://github.com/vinceliuice/WhiteSur-icon-theme.git" "WhiteSur-icon-theme"

# Install vinceliuice WhiteSur-gtk-theme
install "https://github.com/vinceliuice/WhiteSur-gtk-theme.git" "WhiteSur-gtk-theme"
chmod +x ./tweaks.sh

# Apply theme for flatpak apps
./install.sh -l
./tweaks.sh -F
sudo flatpak override --filesystem=xdg-config/gtk-4.0

# Optional: Install gtk theme on firefox
firefox &
./tweaks.sh -f monterey

rm -rf ~/.mozilla/firefox/firefox-themes/*
cp -r ./config/firefox/theme/* ~/.mozilla/firefox/firefox-themes

# Change user default shell
chsh -s "$(which fish)"

