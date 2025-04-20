return {
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            -- Removed nvim-notify since we're disabling notifications
        },
        config = function()
            -- Ensure line numbers
            vim.opt.relativenumber = true
            vim.opt.number = true

            require("noice").setup({
                -- Disable notifications completely
                notify = {
                    enabled = false,
                },

                -- Keep all other features
                lsp = {
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true,
                    },
                    hover = { enabled = true },     -- Keep LSP hover
                    signature = { enabled = true }, -- Keep signature help
                },

                -- Preserve nice cmdline
                cmdline = {
                    enabled = true,
                    view = "cmdline_popup",
                },

                -- Default presets
                presets = {
                    bottom_search = true,
                    command_palette = true,
                    long_message_to_split = true,
                    inc_rename = false,
                    lsp_doc_border = true,
                },
            })
        end,
    },
    {
        "MunifTanjim/nui.nvim",
        lazy = true,
    },
}
