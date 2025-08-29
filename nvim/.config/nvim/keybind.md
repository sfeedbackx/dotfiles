# Neovim Configuration Keybindings

A comprehensive list of keybindings for plugins, LSP, and workflow shortcuts.

**Leader Key**: `<Space>` (set via `vim.g.mapleader = " "`)

---

## Table of Contents
- [Normal Mode](#normal-mode)
- [Visual Mode](#visual-mode)
- [Insert Mode](#insert-mode)
- [Terminal Mode](#terminal-mode)
- [Plugins](#plugins)
- [Notes](#notes)

---

## Normal Mode

### General Navigation
| Keybinding           | Description                                  |
|----------------------|----------------------------------------------|
| `<leader>pv`         | Open file explorer (Netrw)                   |
| `J`                  | Join lines (cursor adjusted)                 |
| `<C-d>`/`<C-u>`      | Half-page down/up (centered cursor)          |
| `n`/`N`              | Next/previous search result (centered)       |
| `<leader>s`          | Search/replace word under cursor             |
| `<leader>x`          | Make file executable (`chmod +x`)            |
| `<leader>u`          | Toggle **Undotree**                          |

### LSP (Language Server Protocol)
| Keybinding           | Description                                  |
|----------------------|----------------------------------------------|
| `gd`                 | Go to definition                             |
| `K`                  | Hover documentation                          |
| `<leader>vcs`        | Search workspace symbols                     |
| `<leader>vd`         | Show diagnostics in floating window          |
| `<leader>vca`        | Open code actions                            |
| `<leader>vgr`        | Find references                              |
| `<leader>vcr`        | Rename symbol                                |
| `[d`/`]d`            | Jump to next/previous diagnostic             |

### Telescope (Fuzzy Finder)
| Keybinding           | Description                                  |
|----------------------|----------------------------------------------|
| `<C-p>`              | Search git files                             |
| `<leader>pf`         | Search all files                             |
| `<leader>fg`         | Live grep (search text)                      |
| `<leader>;`          | Search buffers                               |

### Harpoon (File Navigation)
| Keybinding           | Description                                  |
|----------------------|----------------------------------------------|
| `<leader>a`          | Add file to Harpoon                          |
| `<leader>e`          | Toggle Harpoon quick menu                    |
| `<C-h>`              | Navigate to Harpoon file 1                   |
| `<C-t>`              | Navigate to Harpoon file 2                   |
| `<C-n>`              | Navigate to Harpoon file 3                   |
| `<C-b>`              | Navigate to Harpoon file 4                   |

### Debugging & Development
| Keybinding           | Description                                  |
|----------------------|----------------------------------------------|
| `<leader>zig`        | Restart LSP                                  |
| `<leader>lc`         | Clear lint and restart LSP                   |
| `<leader>la`         | Trigger linting for current file             |
| `<leader>ll`         | Trigger cspell linting for current file      |

### Quickfix & Location Lists
| Keybinding           | Description                                  |
|----------------------|----------------------------------------------|
| `<C-k>`/`<C-j>`      | Next/previous quickfix item                  |
| `<leader>k`/`<leader>j` | Next/previous location list item          |

### Go Language Helpers
| Keybinding           | Description                                  |
|----------------------|----------------------------------------------|
| `<leader>ee`         | Insert error check block                     |
| `<leader>ea`         | Insert assert.NoError                        |
| `<leader>ef`         | Insert error check with log.Fatalf           |
| `<leader>el`         | Insert error check with logger.Error        |

### Terminal
| Keybinding           | Description                                  |
|----------------------|----------------------------------------------|
| `<leader>tt`         | Open terminal                                |
| `<leader>tf`         | Open terminal                                |
| `<leader>th`         | Open horizontal terminal                     |
| `<leader>tv`         | Open vertical terminal                       |

---

## Visual Mode

### Text Manipulation
| Keybinding           | Description                                  |
|----------------------|----------------------------------------------|
| `J`/`K`              | Move selected lines down/up                  |
| `<leader>p`          | Paste without yanking (overwrite)            |
| `<leader>y`          | Yank to system clipboard                     |
| `<leader>d`          | Delete without yanking                       |

---

## Insert Mode

### Navigation & Completion
| Keybinding           | Description                                  |
|----------------------|----------------------------------------------|
| `<C-c>`              | Exit to Normal mode                          |
| `<C-h>`              | Signature help (LSP)                         |

---

## Terminal Mode

### Terminal Navigation
| Keybinding           | Description                                  |
|----------------------|----------------------------------------------|
| `<Esc>`              | Exit terminal mode                           |
| `<C-\><C-n>`         | Exit terminal mode (original)                |
| `<C-h>`/`<C-j>`/`<C-k>`/`<C-l>` | Navigate between windows |
| `<C-w>h`/`<C-w>j`/`<C-w>k`/`<C-w>l` | Navigate between windows (alternative) |

---

## Plugins

### Conform.nvim (Formatting)
| Keybinding           | Description                                  |
|----------------------|----------------------------------------------|
| `<leader>fd`         | Format document synchronously                |

### nvim-cmp (Completion)
| Keybinding           | Description                                  |
|----------------------|----------------------------------------------|
| `<C-p>`/`<C-n>`      | Navigate completion items                    |
| `<C-b>`/`<C-f>`      | Scroll documentation up/down                 |
| `<C-Space>`          | Trigger completion menu                      |
| `<CR>`               | Confirm selection                            |
| `<Tab>`/`<S-Tab>`    | Navigate completion/snippets                 |

### Linting
| Keybinding           | Description                                  |
|----------------------|----------------------------------------------|
| `<leader>lc`         | Clear lint and restart LSP                   |
| `<leader>la`         | Trigger linting for current file             |
| `<leader>ll`         | Trigger cspell linting for current file      |

### Undotree
| Keybinding           | Description                                  |
|----------------------|----------------------------------------------|
| `<leader>u`          | Toggle Undotree                              |

### Built-in Terminal
| Keybinding           | Description                                  |
|----------------------|----------------------------------------------|
| `<leader>tt`         | Open terminal                                |
| `<leader>tf`         | Open terminal                                |
| `<leader>th`         | Open horizontal terminal                     |
| `<leader>tv`         | Open vertical terminal                       |

---
## ⌨️ Cheat Sheet: Terminal + Neovim

---

### 🖥️ Terminal (Bash/Zsh/Kitty etc.)

| Shortcut   | Action                              |
| ---------- | ----------------------------------- |
| `Ctrl + a` | Move to **start of line**           |
| `Ctrl + e` | Move to **end of line**             |
| `Alt + b`  | Move back **one word**              |
| `Alt + f`  | Move forward **one word**           |
| `Ctrl + u` | Delete from cursor → start of line  |
| `Ctrl + k` | Delete from cursor → end of line    |
| `Ctrl + w` | Delete previous word                |
| `Alt + d`  | Delete next word                    |
| `Ctrl + r` | Reverse search in history           |
| `Ctrl + l` | Clear screen                        |
| `!!`       | Repeat last command                 |
| `!ls`      | Run last command starting with `ls` |

---

### 📝 Neovim (Insert Mode)

| Shortcut          | Action                                  |
| ----------------- | --------------------------------------- |
| `Ctrl + h`        | Delete one char before cursor           |
| `Ctrl + w`        | Delete word before cursor               |
| `Ctrl + u`        | Delete to start of line                 |
| `Ctrl + t`        | Increase indent                         |
| `Ctrl + d`        | Decrease indent                         |
| `Ctrl + n`        | Autocomplete (next word)                |
| `Ctrl + p`        | Autocomplete (previous word)            |
| `Ctrl + x Ctrl+f` | Filename completion                     |
| `Ctrl + o`        | Run one Normal-mode command then return |

---

### 🏹 Neovim (Normal Mode – essentials)

| Shortcut   | Action                  |
| ---------- | ----------------------- |
| `:w`       | Save file               |
| `:q`       | Quit                    |
| `:wq`      | Save + quit             |
| `:q!`      | Quit without saving     |
| `i`        | Insert before cursor    |
| `a`        | Insert after cursor     |
| `o`        | New line below + insert |
| `dd`       | Delete line             |
| `yy`       | Yank (copy) line        |
| `p`        | Paste                   |
| `u`        | Undo                    |
| `Ctrl + r` | Redo                    |
| `/text`    | Search for “text”       |
| `n`        | Next search result      |
| `N`        | Previous search result  |

---

## Notes

### Keybinding Conflicts
- **`<C-p>`**: Used for Telescope git files (Normal) and completion navigation (Insert)
- **`<C-h>`**: Used for Harpoon file 1 (Normal) and LSP signature help (Insert)

### Important Reminders
- **Leader Key**: Most bindings start with `<Space>`
- **LSP**: Ensure language servers are installed for full functionality
- **Plugins**: Make sure all required plugins are installed via your package manager

### Customization
- Keybindings can be modified in your Neovim configuration files
- Use `:map` to view current keybindings
- Use `:help key-notation` for key notation reference

---

**Enjoy your supercharged Neovim setup!** 🚀
