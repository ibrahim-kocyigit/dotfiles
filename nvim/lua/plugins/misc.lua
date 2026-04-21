-- Standalone plugins with less than 10 lines of config go here
return {

  {
    -- Powerful Git integration for Vim
    'tpope/vim-fugitive',
  },

  {
    -- Detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',
  },

  {
    -- GitHub integration for vim-fugitive
    'tpope/vim-rhubarb',
  },

  {
    'NvChad/nvim-colorizer.lua', -- maintained fork of norcalli/nvim-colorizer.lua
    config = function()
      require('colorizer').setup()
    end,
  },

  {
    -- Highlight todo, notes, etc in comments
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },

  {

    -- Autoclose parentheses, brackets, quotes, etc.
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    dependencies = { 'hrsh7th/nvim-cmp' },
    config = function()
      require('nvim-autopairs').setup {}
      -- Insert closing pair on cmp <CR> confirm
      local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
      local cmp = require 'cmp'
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },

  --[[

  {
    -- Tmux & split window navigation
    'christoomey/vim-tmux-navigator',
  },


--]]
}
