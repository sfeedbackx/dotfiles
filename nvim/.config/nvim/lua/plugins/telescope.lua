require("vim-options")
return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },

    config = function()
      local telescope = require('telescope')
      local builtin = require('telescope.builtin')

      telescope.setup {
        defaults = {
          layout_strategy = 'horizontal',
          layout_config = {
            width = 0.95,        -- total width of the Telescope window
            preview_width = 0.5, --  width of preview
          },
          previewer = true,
        }
      }

      vim.keymap.set('n', '<C-p>', builtin.git_files, {})
      vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>;', builtin.buffers, {})
    end
  },

  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require('telescope').setup {
        extensions = {
          ['ui-select'] = {
            -- Use a full layout with previewer enabled
            layout_strategy = 'horizontal',
            previewer = true,
            layout_config = {
              width = 0.95,
              preview_width = 0.7,
            },
          }
        }
      }

      require('telescope').load_extension('ui-select')
    end
  }
}
