return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        -- Define formatters for specific file types
        formatters_by_ft = {
            javascript = { "biome","prettierd", "prettier" }, -- Use Prettier for JavaScript
            java = { "google_java_format" },          -- Use Google Java Format for Java
            typescript = { "biome" }
        },
        -- Format on save disabled - you can still format manually with <leader>fd
        -- format_on_save = {
        --     timeout_ms = 5000,   -- Timeout for formatting on save
        --     lsp_fallback = true, -- Fallback to LSP formatting if no formatter is found
        -- },
    },
    config = function(_, opts)
        local conform = require("conform")
        -- Set up conform with the provided options
        conform.setup(opts)
        -- Keybinding for formatting (leader + fd)
        vim.keymap.set("n", "<leader>fd", function()
            conform.format({
                async = false,       -- Perform formatting synchronously
                lsp_fallback = true, -- Fallback to LSP if no formatter is available
            })
        end, { desc = "Format Document" })
    end,
}
