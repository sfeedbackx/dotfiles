# Neovim Configuration Keybindings

A comprehensive list of keybindings for plugins, LSP, and workflow shortcuts.
**Leader Key**: `<Space>` (set via `vim.g.mapleader = " "`).

---

## Table of Contents
- [Normal Mode](#normal-mode)
- [Visual Mode](#visual-mode)
- [Insert Mode](#insert-mode)
- [Plugins](#plugins)
- [Notes](#notes)

---

## Normal Mode

### General
| Keybinding           | Description                                  |
|----------------------|----------------------------------------------|
| `<leader>pv`         | Open file explorer (Netrw)                   |
| `J`                  | Join lines (cursor adjusted)                 |
| `<C-d>`/`<C-u>`      | Half-page down/up (centered cursor)          |
| `n`/`N`              | Next/previous search result (centered)       |
| `<leader>f`          | Format buffer with LSP                       |
| `<leader>s`          | Search/replace word under cursor             |
| `<leader>x`          | Make file executable (`chmod +x`)            |
| `<leader><leader>`   | Source current file                          |
| `<leader>u`          | Toggle **Undotree**                          |

### LSP
| Keybinding           | Description                                  |
|----------------------|----------------------------------------------|
| `gd`                 | Go to definition                             |
| `K`                  | Hover documentation                          |
| `<leader>vws`        | Search workspace symbols                     |
| `<leader>vd`         | Show diagnostics in floating window          |
| `<leader>vca`        | Open code actions                            |
| `<leader>vrr`        | Find references                              |
| `<leader>vrn`        | Rename symbol                                |
| `[d`/`]d`            | Jump to next/previous diagnostic             |

### Telescope
| Keybinding           | Description                                  |
|----------------------|----------------------------------------------|
| `<C-p>`              | Search files                                 |
| `<leader>fg`         | Live grep (search text)                      |

### Harpoon
| Keybinding           | Description                                  |
|----------------------|----------------------------------------------|
| `<leader>a`          | Add file to Harpoon                          |
| `<leader>e`          | Toggle Harpoon quick menu                    |
| `<C-h>`/`<C-t>`      | Navigate to Harpoon file 1/2                 |
| `<C-n>`/`<C-s>`      | Navigate to Harpoon file 3/4                 |

### Debugging/Helpers
| Keybinding           | Description                                  |
|----------------------|----------------------------------------------|
| `<leader>zig`        | Restart LSP                                  |
| `<leader>ll`         | Trigger linting for current file             |
| `<leader>ca`         | Start cellular automaton animation           |



---

## Visual Mode
| Keybinding           | Description                                  |
|----------------------|----------------------------------------------|
| `J`/`K`              | Move selected lines down/up                  |
| `<leader>p`          | Paste without yanking (overwrite)            |
| `<leader>y`          | Yank to system clipboard                     |
| `<leader>d`          | Delete without yanking                       |

---

## Insert Mode
| Keybinding           | Description                                  |
|----------------------|----------------------------------------------|
| `<C-c>`              | Exit to Normal mode                          |
| `<Tab>`/`<S-Tab>`    | Navigate completion/snippets (SuperTab-like) |
| `<C-h>`              | Signature help (LSP)                         |

---

## Plugins

### Conform.nvim (Formatting)
- `<leader>fd`: Format document synchronously.

### nvim-cmp (Completion)
- `<C-p>`/`<C-n>`: Navigate completion items.
- `<C-Space>`: Trigger completion menu.

### Linting
- `<leader>ll`: Lint current file (`nvim-lint`).

### Undotree
- `<leader>u`: Toggle Undotree.

---

## Notes
- **Conflicts**:
  - `<C-p>`: Used for Telescope file search (Normal) and completion navigation (Insert).
  - `<C-h>`: Used for Harpoon file 1 (Normal) and LSP signature help (Insert).
- **Leader Key**: Most bindings start with `<Space>`.
- **Diagnostics**: Enable with `:lua vim.diagnostic.config(...)`.

---

**Enjoy your supercharged Neovim setup!** 🚀
