require ("vim-options")
return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<C-p>', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    end
  },
  
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require('telescope').setup {
        extensions = {
          ['ui-select'] = {
            -- Custom UI Select dropdown options can be placed here
            -- For example, to add a custom dropdown theme:
            theme = require('telescope.themes').get_dropdown({
              -- Add any additional options here
            }),
          }
        }
      }
      
      -- Load the 'ui-select' extension
      require('telescope').load_extension('ui-select')
    end
  }
}
