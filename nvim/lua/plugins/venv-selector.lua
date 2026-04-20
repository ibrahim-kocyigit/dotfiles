return {
  'linux-cultist/venv-selector.nvim',
  branch = 'regexp',
  dependencies = {
    'neovim/nvim-lspconfig',
    'nvim-telescope/telescope.nvim',
    'mfussenegger/nvim-dap-python',
  },
  ft = 'python',
  opts = {
    settings = {
      options = {
        notify_user_on_venv_activation = true,
      },
      search = {
        -- Search for venvs in common locations relative to the project root
        venv = { name = '.venv', type = 'dir' },
        virtualenv = { name = 'virtualenv', type = 'dir' },
        pyenv = {
          command = 'find ' .. vim.fn.expand '~/.pyenv/versions' .. ' -name python3 -type f 2>/dev/null',
          type = 'python',
        },
      },
    },
  },
  keys = {
    { '<leader>pv', '<cmd>VenvSelect<CR>',       desc = 'Select Python venv' },
    { '<leader>pc', '<cmd>VenvSelectCached<CR>', desc = 'Select cached Python venv' },
  },
}