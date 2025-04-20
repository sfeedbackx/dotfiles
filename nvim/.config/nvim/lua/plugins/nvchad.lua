return {
    {
        "nvchad/base46",
        lazy = true,
        build = function()
            require("base46").load_all_highlights()
        end,
    },
    {
        "nvchad/ui",
        lazy = false,                      -- Ensure UI loads on startup
        dependencies = {
            "nvim-tree/nvim-web-devicons", -- For file icons
            "nvim-lua/plenary.nvim",       -- Required for some UI features
        },
        config = function()
            require("nvchad")
        end,
    },
}
