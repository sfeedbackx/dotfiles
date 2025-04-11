
return {
    "mfussenegger/nvim-lint",
    event = {
        "BufReadPre",
        "BufNewFile",  -- Not "BufNewPre" – usually it's "BufNewFile"
    },
    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            javascript = { "eslint_d" },
        }

        vim.keymap.set("n", "<leader>ll", function()
            lint.try_lint()
        end, { desc = "Trigger linting for current file" })
    end,
}

