return {
    "mfussenegger/nvim-lint",
    event = {
        "BufReadPre",
        "BufNewFile", -- Not "BufNewPre" – usually it's "BufNewFile"
    },
    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            javascript = { "eslint" },
            typescript = { "eslint" },
            javascriptreact = { "eslint" },
            typescriptreact = { "eslint" },
            svelte = { "eslint" },
            kotlin = { "ktlint" },
            terraform = { "tflint" },
            python = { "pylint" },
        }

        local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })


        vim.keymap.set("n", "<leader>ll", function()
            lint.try_lint()
        end, { desc = "Trigger linting for current file" })
    end,
}
