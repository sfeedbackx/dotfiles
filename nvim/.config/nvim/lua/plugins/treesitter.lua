return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = {
        "c", "lua", "vim", "vimdoc", "query",
        "elixir", "heex", "javascript", "html",
        "python", "typescript", "json", "css"
      },
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
      },
      incremental_selection = { enable = true },
      textobjects = { enable = true },
      indent = { enable = true },
    })
  end
}
