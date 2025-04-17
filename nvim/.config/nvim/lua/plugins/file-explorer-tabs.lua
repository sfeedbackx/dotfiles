return {
    -- File Explorer
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons", -- file icons
        },
        config = function()
            require("nvim-tree").setup({
                view = {
                    width = 35,
                },
                renderer = {
                    group_empty = true,
                    highlight_git = true,
                    highlight_opened_files = "all",
                },
                filters = {
                    dotfiles = false,
                },
            })

            -- Toggle file explorer
            vim.keymap.set("n", "<leader>n", ":NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })

            -- Auto-close nvim-tree if it's the only open window
            vim.api.nvim_create_autocmd("QuitPre", {
                callback = function()
                    local tree_wins = {}
                    local wins = vim.api.nvim_list_wins()
                    for _, w in ipairs(wins) do
                        local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
                        if bufname:match("NvimTree_") then
                            table.insert(tree_wins, w)
                        end
                    end
                    if #tree_wins == #wins - 1 then
                        vim.cmd("NvimTreeClose")
                    end
                end,
            })
        end,
    },

    -- Bufferline (Tabs)
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require("bufferline").setup({
                options = {
                    mode = "buffers",
                    diagnostics = "nvim_lsp",
                    separator_style = "none", -- Flat rectangular tabs
                    show_buffer_close_icons = false,
                    show_close_icon = false,
                    always_show_bufferline = true,
                    tab_size = 20,        -- For wider tabs
                    max_name_length = 18, -- Adjust tab name length
                    offsets = {
                        {
                            filetype = "NvimTree",
                            text = "File Explorer",
                            highlight = "Directory",
                            text_align = "left",
                            separator = true,
                        },
                    },
                },
                highlights = require("catppuccin.groups.integrations.bufferline").get(), -- For catppuccin theme
            })

            -- Keymaps for buffer navigation
            vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { desc = "Next Buffer" })
            vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { desc = "Previous Buffer" })
            vim.keymap.set("n", "<leader>bb", ":BufferLinePick<CR>", { desc = "Pick a Buffer" })
        end,
    },
}
