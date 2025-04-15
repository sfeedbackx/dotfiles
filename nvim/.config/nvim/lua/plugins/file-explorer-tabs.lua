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
                },
                filters = {
                    dotfiles = false,
                },
            })

            -- Toggle file explorer
            vim.keymap.set("n", "<leader>n", ":NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })

            -- Close nvim-tree when quitting
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
                    separator_style = "slant",
                    show_buffer_close_icons = false,
                    show_close_icon = false,
                    always_show_bufferline = true,
                },
            })

            -- Keymaps to navigate tabs
            vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { desc = "Next Tab" })
            vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { desc = "Previous Tab" })
        end,
    },
}
