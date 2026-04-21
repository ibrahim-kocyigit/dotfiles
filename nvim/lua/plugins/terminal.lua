return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 20,
      open_mapping = [[<c-\>]], -- Standard toggle mapping
      hide_numbers = true,
      shade_terminals = true,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = 'horizontal', -- Default direction
      close_on_exit = true,
    })

    -- CO-LOCATED KEYMAPS (Module-Action-Option)
    local opts = { noremap = true, silent = true }

    -- [T]erminal...
    -- [t]oggle (The easy-to-reach replacement for Ctrl+\)
    vim.keymap.set('n', '<leader>Tt', '<cmd>ToggleTerm<CR>', 
        vim.tbl_extend('force', opts, { desc = '[t]oggle' }))

    -- [o]pen...
    vim.keymap.set('n', '<leader>Tov', '<cmd>ToggleTerm direction=vertical<CR>', 
        vim.tbl_extend('force', opts, { desc = '[v]ertical' }))
    vim.keymap.set('n', '<leader>Toh', '<cmd>ToggleTerm direction=horizontal<CR>', 
        vim.tbl_extend('force', opts, { desc = '[h]orizontal' }))
    vim.keymap.set('n', '<leader>Tof', '<cmd>ToggleTerm direction=float<CR>', 
        vim.tbl_extend('force', opts, { desc = '[f]loat' }))

    -- [p]ython...
    -- These run the current file and wait for a keypress (using zsh/Ghostty syntax)
    vim.keymap.set('n', '<leader>Tpv', '<cmd>TermExec cmd="python3 %; read -k 1" direction=vertical<CR>', 
        vim.tbl_extend('force', opts, { desc = '[v]ertical' }))
    vim.keymap.set('n', '<leader>Tph', '<cmd>TermExec cmd="python3 %; read -k 1" direction=horizontal<CR>', 
        vim.tbl_extend('force', opts, { desc = '[h]orizontal' }))

    -- Terminal Mode Escape (Caps Lock)
    vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], opts)

-- This lets you toggle the terminal OFF even when you are in "typing" mode
vim.keymap.set('t', '<leader>Tt', '<cmd>ToggleTerm<CR>', opts)
  end
}
