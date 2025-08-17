#!/bin/bash

# ZSH Configuration Setup Script
# This script installs all dependencies required for the zsh configuration

echo "🚀 Setting up ZSH configuration..."

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

echo "📦 Installing ZSH dependencies..."

# Install ZSH if not present
if ! command_exists zsh; then
    echo "Installing ZSH..."
    install_package zsh
fi

# Install Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Install Powerlevel10k theme
if [ ! -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" ]; then
    echo "Installing Powerlevel10k theme..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

# Install ZSH plugins
echo "Installing ZSH plugins..."

# zsh-autosuggestions
if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

# zsh-syntax-highlighting
if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

# fast-syntax-highlighting
if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/fast-syntax-highlighting" ]; then
    git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
fi

# zsh-autocomplete
if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autocomplete" ]; then
    git clone https://github.com/marlonrichert/zsh-autocomplete.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autocomplete
fi

# Install additional tools
echo "Installing additional tools..."

# Install NVM (Node Version Manager)
if [ ! -d "$HOME/.nvm" ]; then
    echo "Installing NVM..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
fi

# Install FZF (Fuzzy Finder)
if ! command_exists fzf; then
    echo "Installing FZF..."
    if command_exists apt; then
        sudo apt install -y fzf
    elif command_exists pacman; then
        sudo pacman -S --noconfirm fzf
    elif command_exists dnf; then
        sudo dnf install -y fzf
    elif command_exists brew; then
        brew install fzf
    else
        git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
        ~/.fzf/install --all
    fi
fi

# Install Neovim
if ! command_exists nvim; then
    echo "Installing Neovim..."
    if command_exists apt; then
        sudo apt install -y neovim
    elif command_exists pacman; then
        sudo pacman -S --noconfirm neovim
    elif command_exists dnf; then
        sudo dnf install -y neovim
    elif command_exists brew; then
        brew install neovim
    else
        echo "Please install Neovim manually from https://neovim.io/"
    fi
fi



echo "✅ ZSH setup complete!"
echo "🔧 Next steps:"
echo "1. Restart your terminal or run: source ~/.zshrc"
echo "2. Run 'p10k configure' to configure Powerlevel10k theme"
echo "3. Install any additional tools you need (Java for TLauncher, etc.)"
