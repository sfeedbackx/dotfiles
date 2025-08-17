#!/bin/bash

# Comprehensive Dotfiles Setup Script
# This script installs all dependencies required for all configurations

echo "🚀 Setting up all dotfiles configurations..."

# Check if running as root
if [[ $EUID -eq 0 ]]; then
   echo "❌ This script should not be run as root"
   exit 1
fi

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to install package based on distribution
install_package() {
    local package=$1
    if command_exists apt; then
        sudo apt install -y "$package"
    elif command_exists pacman; then
        sudo pacman -S --noconfirm "$package"
    elif command_exists dnf; then
        sudo dnf install -y "$package"
    elif command_exists brew; then
        brew install "$package"
    else
        echo "❌ Unsupported package manager. Please install $package manually."
    fi
}

echo "📦 Installing core dependencies..."

# Core system packages
CORE_PACKAGES=(
    "git"
    "curl"
    "wget"
    "stow"
    "xrandr"
    "feh"
    "i3lock"
    "kitty"
    "thunar"
    "rofi"
    "maim"
    "xdotool"
    "xclip"
    "pulseaudio-utils"
    "brightnessctl"
    "picom"
    "polybar"
    "tmux"
    "neovim"
    "zsh"
    "lxappearance"
    "arandr"
    "xautolock"
    "betterlockscreen"
    "network-manager"
    "network-manager-gnome"
    "policykit-1-gnome"
    "setxkbmap"
    "xrdb"
    "xset"
    "pactl"
    "playerctl"
    "python3"
    "python3-pip"
    "nodejs"
    "npm"
    "java"
    "cmake"
    "build-essential"
)

for package in "${CORE_PACKAGES[@]}"; do
    echo "Installing $package..."
    install_package "$package"
done

echo "🔧 Setting up ZSH..."
# Run ZSH setup
if [ -f "zsh/setup.sh" ]; then
    bash zsh/setup.sh
fi

echo "📱 Setting up Tmux plugins..."
# Install Tmux Plugin Manager
if [ ! -d "$HOME/.config/tmux/.tmux/plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm "$HOME/.config/tmux/.tmux/plugins/tpm"
fi

echo "✅ All dependencies installed!"
echo "🔧 Next steps:"
echo "1. Run 'stow <config-name>' for each configuration you want to use"
echo "2. Restart your system or log out and back in"
echo "3. Configure Powerlevel10k: p10k configure"
echo "4. Install Tmux plugins: tmux source ~/.tmux.conf"
