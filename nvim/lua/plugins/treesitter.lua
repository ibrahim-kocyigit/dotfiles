return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  lazy = false,
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
  config = function(_, opts)
    require('nvim-treesitter').setup(opts)

    -- Ensure treesitter highlight attaches on every buffer open
    vim.api.nvim_create_autocmd('FileType', {
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })

-- CO-LOCATED KEYMAPS (Module-Action-Option)
local keymap_opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>uts', function()
  local buf = vim.api.nvim_get_current_buf()
  if vim.treesitter.highlighter.active[buf] then
    vim.treesitter.stop(buf)
  else
    vim.treesitter.start(buf)
  end
end, vim.tbl_extend('force', keymap_opts, { desc = '[s]yntax' }))
  end,
}
