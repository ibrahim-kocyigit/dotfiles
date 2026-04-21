return {
  'nvim-treesitter/nvim-treesitter',
  version = "v0.9.3", 
  build = ':TSUpdate',
  lazy = false,
  cmd = { 'TSInstall', 'TSUninstall', 'TSUpdate', 'TSUpdateSync', 'TSInstallInfo', 'TSInstallSync' },
  opts = {
    ensure_installed = {
      'lua', 'python', 'vimdoc', 'vim', 'regex', 'terraform', 'sql',
      'dockerfile', 'toml', 'json', 'gitignore', 'yaml', 'make',
      'cmake', 'ninja', 'markdown', 'markdown_inline', 'rst', 'bash',
    },
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = { 'ruby' },
    },
    indent = { enable = true, disable = { 'ruby' } },
  },
  -- [u]i [t]oggle [s]yntax
  init = function()
    local opts = { noremap = true, silent = true }
    vim.keymap.set('n', '<leader>uts', '<cmd>TSBufToggle highlight<CR>', 
        vim.tbl_extend('force', opts, { desc = '[s]yntax' }))
  end,
}

