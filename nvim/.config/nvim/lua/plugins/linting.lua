return {
  "mfussenegger/nvim-lint",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  config = function()
    local lint = require("lint")
    lint.linters_by_ft = {
      javascript = { "biomejs" },
      typescript = { "biomejs" },
      javascriptreact = { "eslint" },
      typescriptreact = { "eslint" },
      svelte = { "eslint" },
      kotlin = { "ktlint" },
      terraform = { "tflint" },
      python = { "pylint" },
    }
    vim.keymap.set("n", "<leader>lc", function()
      vim.diagnostic.reset()
      vim.cmd('LspRestart')
    end, { desc = "clear lint" })

    vim.keymap.set("n", "<leader>la", function()
      lint.try_lint()
    end, { desc = "Trigger linting with for current file" })

    vim.keymap.set("n", "<leader>ll", function()
      lint.try_lint("cspell")
    end, { desc = "Trigger linting with cspell for current file" })
  end,
}
