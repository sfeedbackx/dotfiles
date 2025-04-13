return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            transparent_background = true, -- Enable transparency
        })
        vim.cmd.colorscheme "catppuccin"
    end
}
