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

- **Shell Configurations**:
  - Custom `.bashrc` and `.zshrc` files with personalized aliases, functions, and prompt settings.
- **polybar**:
  - Configuration files for my bar 
- **i3 Window Manager**:
  - Configurations for the i3 window manager, featuring custom keybindings, layouts, and status bar settings.

- **Other Configurations**:
  - Additional settings for applications like `kitty` (terminal), pk10, and more!
- **in the Future**
 -I will add neovim (still using vscode retard I know and Tmux)
## 🚀 Installation

To set up these dotfiles on your system, follow these steps:

### 1. Clone the Repository

First, clone this repository to your home directory:

```bash
git clone https://github.com/your-username/dotfiles.git
cd dotfiles
```
### 2. Install GNU Stow

Ensure that GNU Stow is installed on your system. You can install it using your package manager:

- **Debian/Ubuntu**:

  ```bash
  sudo apt install stow
  ```

- **macOS (Homebrew)**:

  ```bash
  brew install stow
  ```

- **Arch Linux**:

  ```bash
  sudo pacman -S stow
  ```
  
### 4. Install Required Tools

The i3 configuration in this repository relies on specific tools. Install them with a single command based on your distribution:

 ```bash
sudo apt install arandr feh i3lock-fancy compton xautolock i3lock kitty thunar rofi maim xdotool xclip pulseaudio-utils brightnessctl
```


### 3. Stow the Dotfiles

Run the following command to create symlinks for the desired configuration:

```sh
stow <directory-name>
```

For example, to set up your shell and Vim configurations, run:

```sh
stow bash
stow i3
```

This will create symlinks in your home directory, pointing to the files in the repository.

### 4. Customize as Needed

You can customize the configurations by editing the files in this repository. Any changes will be reflected on your system because of the symlinks created by GNU Stow.

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
stow i3
```


## 🤝 Contributing

If you have suggestions or improvements, feel free to open an issue or create a pull request. Contributions are welcome!


### Thank You for Visiting!

I hope you find these dotfiles helpful! Feel free to explore, use, and customize them to fit your needs.
Explanation of Markdown Syntax
Backticks (`): Used to format code blocks.
Bold and Italics: You can use **bold** or *italics* for text emphasis.
Lists: Use -, *, or + for bullet points and numbers for ordered lists.
Headings: Use # for headings, with multiple # to indicate heading levels.
Replace placeholders with your actual details, such as your username and email. This README is now fully formatted for Markdown!












