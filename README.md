# Dotfiles
Welcome to my dotfiles repository! This repo contains my personal configuration files for various applications and tools I use daily. By using [GNU Stow](https://www.gnu.org/software/stow/), I keep these configurations organized and easily manageable across different machines.

## 🗂 What is GNU Stow?

[GNU Stow](https://www.gnu.org/software/stow/) is a symlink manager that allows you to manage your dotfiles (configuration files) across multiple applications from a single directory. It creates symbolic links (symlinks) from the directory where you store your dotfiles (e.g., `~/dotfiles`) to their respective locations in your home directory.

This approach keeps your home directory clean, organized, and version-controlled, allowing for easy backups and synchronization between different machines.

### How Does Stow Work?

1. **Directory Structure**: You place your dotfiles in appropriately named subdirectories (e.g., `i3`, `zsh`) within your main dotfiles directory.
2. **Create Symlinks**: Stow creates symlinks from these subdirectories to your home directory or any other target directory.
3. **Manage Configurations**: You can easily add, remove, or update configurations by simply running Stow commands.

## 📋 Features

- **ZSH Shell Configuration**:
  - Custom `.zshrc` with Oh My Zsh, Powerlevel10k theme, and essential plugins
  - Aliases, functions, and personalized prompt settings
  - NVM and FZF integration
- **i3 Window Manager**:
  - Complete i3 configuration with custom keybindings and layouts
  - Multi-monitor support and workspace management
  - Integration with polybar, rofi, and other tools
- **Polybar Status Bar**:
  - Custom status bar with system monitoring
  - Workspace indicators, audio controls, and system info
- **Kitty Terminal**:
  - Terminal emulator with Catppuccin theme
  - Custom font and transparency settings
- **Neovim**:
  - Modern Neovim configuration with Lazy.nvim plugin manager
  - Custom plugins and settings
- **Tmux**:
  - Terminal multiplexer with Catppuccin theme
  - Session management and navigation plugins
- **VSCode Profiles**:
  - Multiple code profiles for different development environments
  - Custom settings and extensions
- **Picom Compositor**:
  - Window effects and transparency configuration
- **Rofi Application Launcher**:
  - Custom menus for applications, windows, and power management
- **Xresources & Xsettingsd**:
  - X11 resource configuration for consistent theming
- **Font Configuration**:
  - Nerd Fonts and custom font setup
- **Gogeta Wallpapers**:
  - Custom wallpaper collection

## 🚀 Installation

To set up these dotfiles on your system, follow these steps:

### 1. Clone the Repository

First, clone this repository to your home directory:

```bash
git clone https://github.com/subomega1/dotfiles.git
cd dotfiles
```

### 2. Quick Setup (Recommended)

For a complete setup with all dependencies, run the automated setup script:

```bash
./setup.sh
```

This script will:
- Install all required system packages
- Set up ZSH with Oh My Zsh and Powerlevel10k
- Install Nerd Fonts
- Configure Neovim plugins
- Set up Tmux plugins
- Install additional tools (Spicetify, FZF, etc.)

### 3. Manual Installation

If you prefer manual installation, follow these steps:

#### Install GNU Stow

Ensure that GNU Stow is installed on your system:

- **Debian/Ubuntu**:
  ```bash
  sudo apt install stow
  ```

- **Arch Linux**:
  ```bash
  sudo pacman -S stow
  ```

- **macOS (Homebrew)**:
  ```bash
  brew install stow
  ```

#### Install Core Dependencies

Install the required system packages:

```bash
# Debian/Ubuntu
sudo apt install git curl wget stow xrandr feh i3lock kitty thunar rofi maim xdotool xclip pulseaudio-utils brightnessctl picom polybar tmux neovim zsh lxappearance arandr xautolock betterlockscreen network-manager network-manager-gnome policykit-1-gnome python3 python3-pip nodejs npm java cmake build-essential

# Arch Linux
sudo pacman -S git curl wget stow xorg-xrandr feh i3lock kitty thunar rofi maim xdotool xclip pulseaudio brightnessctl picom polybar tmux neovim zsh lxappearance arandr xautolock betterlockscreen networkmanager network-manager-applet polkit-gnome python nodejs npm jdk-openjdk cmake base-devel
```

#### Install Fonts

Install the required Nerd Fonts:

```bash
# Create fonts directory
mkdir -p ~/.local/share/fonts

# Download MesloLGS NF fonts
wget -O ~/.local/share/fonts/MesloLGS\ NF\ Regular.ttf "https://github.com/romkatv/powerlevel10k/raw/master/font/MesloLGS%20NF%20Regular.ttf"
wget -O ~/.local/share/fonts/MesloLGS\ NF\ Bold.ttf "https://github.com/romkatv/powerlevel10k/raw/master/font/MesloLGS%20NF%20Bold.ttf"
wget -O ~/.local/share/fonts/MesloLGS\ NF\ Italic.ttf "https://github.com/romkatv/powerlevel10k/raw/master/font/MesloLGS%20NF%20Italic.ttf"
wget -O ~/.local/share/fonts/MesloLGS\ NF\ Bold\ Italic.ttf "https://github.com/romkatv/powerlevel10k/raw/master/font/MesloLGS%20NF%20Bold%20Italic.ttf"

# Update font cache
fc-cache -fv
```

### 4. Stow the Configurations

Run the following commands to create symlinks for your desired configurations:

```bash
# Install all configurations
stow zsh i3 polybar kitty nvim tmux vscode picom rofi xresources xsettingsd font

# Or install individually
stow zsh
stow i3
stow polybar
# ... etc
```

### 5. Post-Installation Setup

After stowing the configurations, complete the setup:

```bash
# Configure Powerlevel10k theme
p10k configure

# Install Tmux plugins
tmux source ~/.tmux.conf

# Install Neovim plugins
nvim --headless -c "Lazy! sync" -c "qa"


```

## 🛠️ Usage

After setting up, use the following commands to manage your dotfiles:

- **To apply a new configuration**: 

  ```sh
  stow <directory-name>
  ```

- **To remove a configuration**:

  ```sh
  stow -D <directory-name>
  ```

For example, to remove the i3 configuration:

```sh
stow -D i3
```

## 📁 Available Configurations

This repository includes configurations for:

- `zsh/` - ZSH shell with Oh My Zsh and Powerlevel10k
- `i3/` - i3 window manager with custom keybindings
- `polybar/` - Status bar with system monitoring
- `kitty/` - Terminal emulator with Catppuccin theme
- `nvim/` - Neovim editor with Lazy.nvim plugin manager
- `tmux/` - Terminal multiplexer with Catppuccin theme
- `vscode/` - VSCode profiles for different environments
- `picom/` - Compositor for window effects
- `rofi/` - Application launcher and menus
- `xresources/` - X11 resource configuration
- `xsettingsd/` - X11 settings daemon
- `font/` - Nerd Fonts configuration
- `gogeta/` - Custom wallpaper collection

## 📦 Dependencies

### System Requirements

- **Linux Distribution**: Ubuntu/Debian, Arch Linux, or similar
- **Display Server**: X11 (Xorg)
- **Window Manager**: i3-gaps or i3-wm
- **Shell**: ZSH

### Core Dependencies

#### System Packages
- `git`, `curl`, `wget` - Basic utilities
- `stow` - Symlink manager for dotfiles
- `xrandr`, `arandr` - Display management
- `feh` - Image viewer and wallpaper setter
- `i3lock`, `betterlockscreen` - Screen locking
- `kitty` - Terminal emulator
- `thunar` - File manager
- `rofi` - Application launcher
- `maim`, `xdotool`, `xclip` - Screenshot and clipboard tools
- `pulseaudio-utils`, `playerctl` - Audio controls
- `brightnessctl` - Brightness control
- `picom` - Compositor
- `polybar` - Status bar
- `tmux` - Terminal multiplexer
- `neovim` - Text editor
- `zsh` - Shell
- `lxappearance` - GTK theme manager
- `xautolock` - Auto-lock screen
- `network-manager`, `network-manager-gnome` - Network management
- `policykit-1-gnome` - Authentication agent
- `python3`, `nodejs`, `npm` - Development tools
- `java`, `cmake`, `build-essential` - Build tools

#### Fonts
- **MesloLGS NF** - Nerd Font for Powerlevel10k and icons

#### ZSH Dependencies
- **Oh My Zsh** - ZSH framework
- **Powerlevel10k** - ZSH theme
- **zsh-autosuggestions** - Command suggestions
- **zsh-syntax-highlighting** - Syntax highlighting
- **fast-syntax-highlighting** - Fast syntax highlighting
- **zsh-autocomplete** - Command completion
- **NVM** - Node Version Manager
- **FZF** - Fuzzy finder

#### Neovim Dependencies
- **Lazy.nvim** - Plugin manager
- **Various plugins** - See `nvim/.config/nvim/lua/plugins/` for full list

#### Tmux Dependencies
- **TPM** - Tmux Plugin Manager
- **vim-tmux-navigator** - Seamless navigation
- **tmux-sessionx** - Session management
- **catppuccin/tmux** - Theme
- **tmux-online-status** - Online status indicator
- **tmux-battery** - Battery indicator

#### i3 Dependencies
- **autotiling** - Automatic tiling
- **Custom scripts** - Lock/unlock, power management, media controls

#### Polybar Dependencies
- **Custom modules** - Workspace indicators, audio controls, system monitoring

#### Rofi Dependencies
- **Custom scripts** - WiFi menu, power menu, window switching

## 🔧 Troubleshooting

### Common Issues

1. **Fonts not displaying correctly**:
   ```bash
   fc-cache -fv
   ```

2. **Polybar not starting**:
   ```bash
   # Check if polybar is installed
   which polybar
   # Check configuration
   polybar --config=~/.config/polybar/config.ini --log=trace toph
   ```

3. **i3 not loading**:
   ```bash
   # Check i3 config syntax
   i3-config-wizard
   ```

4. **ZSH plugins not working**:
   ```bash
   # Reinstall Oh My Zsh
   sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
   ```

5. **Neovim plugins not loading**:
   ```bash
   # Sync plugins
   nvim --headless -c "Lazy! sync" -c "qa"
   ```

### Getting Help

- Check the configuration files for comments and documentation
- Review the setup scripts for installation steps
- Ensure all dependencies are properly installed
- Check system logs for error messages

## 🤝 Contributing

If you have suggestions or improvements, feel free to open an issue or create a pull request. Contributions are welcome!

## 🙏 Thank You for Visiting!

I hope you find these dotfiles helpful! Feel free to explore, use, and customize them to fit your needs.












