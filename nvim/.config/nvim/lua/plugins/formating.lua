return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    formatters_by_ft = {
      javascript = { "biome", "prettierd", "prettier" },
      java = { "google_java_format" },
      typescript = { "biome" }
    },
  },
  config = function(_, opts)
    local conform = require("conform")
    conform.setup(opts)
    vim.keymap.set("n", "<leader>fd", function()
      conform.format({
        async = false,
        lsp_fallback = true, -- Fallback to LSP if no formatter is available
      })
    end, { desc = "Format Document" })
  end,
}
