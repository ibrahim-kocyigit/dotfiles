return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {},
  config = function(_, opts)
    require('trouble').setup(opts)

    -- CO-LOCATED KEYMAPS (Module-Action-Option)
    local keymap_opts = { noremap = true, silent = true }

    -- [d]iagnostic [g]o
    vim.keymap.set('n', '<leader>dgn', function()
      vim.diagnostic.jump { count = 1, float = true }
    end, vim.tbl_extend('force', keymap_opts, { desc = '[n]ext' }))

    vim.keymap.set('n', '<leader>dgp', function()
      vim.diagnostic.jump { count = -1, float = true }
    end, vim.tbl_extend('force', keymap_opts, { desc = '[p]revious' }))

    -- [d]iagnostic [s]how
    vim.keymap.set('n', '<leader>dsf', vim.diagnostic.open_float,
      vim.tbl_extend('force', keymap_opts, { desc = '[f]loating' }))

    vim.keymap.set('n', '<leader>dsl', vim.diagnostic.setloclist,
      vim.tbl_extend('force', keymap_opts, { desc = '[l]ist' }))

    vim.keymap.set('n', '<leader>dsd', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
      vim.tbl_extend('force', keymap_opts, { desc = '[d]ocument' }))

    vim.keymap.set('n', '<leader>dsw', '<cmd>Trouble diagnostics toggle<cr>',
      vim.tbl_extend('force', keymap_opts, { desc = '[w]orkspace' }))

    vim.keymap.set('n', '<leader>dss', '<cmd>Trouble symbols toggle focus=false<cr>',
      vim.tbl_extend('force', keymap_opts, { desc = '[s]ymbols' }))

    -- [d]iagnostic [l]sp
    vim.keymap.set('n', '<leader>dll', '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
      vim.tbl_extend('force', keymap_opts, { desc = '[l]sp references' }))

    vim.keymap.set('n', '<leader>dlq', '<cmd>Trouble qflist toggle<cr>',
      vim.tbl_extend('force', keymap_opts, { desc = '[q]uickfix list' }))

    vim.keymap.set('n', '<leader>dlo', '<cmd>Trouble loclist toggle<cr>',
      vim.tbl_extend('force', keymap_opts, { desc = '[o]clist' }))
  end,
}
