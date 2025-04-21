return {
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
        },
        config = function()
            vim.opt.relativenumber = true
            vim.opt.number = true

            require("noice").setup({
                -- Disable custom notification UI
                notify = {
                    enabled = false,
                },

                -- Disable Noice’s message view — fallback to default Neovim
                messages = {
                    enabled = false,
                },

                -- Keep LSP enhancements
                lsp = {
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true,
                    },
                    hover = { enabled = true },
                    signature = { enabled = true },
                    message = {
                        enabled = false, -- let Neovim handle LSP messages normally
                    },
                },

                -- Keep the pop-up cmdline
                cmdline = {
                    enabled = true,
                    view = "cmdline_popup",
                },

                presets = {
                    bottom_search = true,
                    command_palette = true,
                    long_message_to_split = false, -- also disables top-bar override
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
