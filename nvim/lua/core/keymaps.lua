-------------------- !! LEADER KEY (Must stay at top) --------------------
vim.g.mapleader = ' '
vim.g.maplocalleader = [[\\]]
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })


-------------------- SHARED OPTIONS --------------------
local opts = { noremap = true, silent = true }


-------------------- TURKISH KEYBOARD REMAPS --------------------
vim.keymap.set({ 'n', 'v', 'o', 'x' }, 'ı', 'k', opts)
vim.keymap.set({ 'n', 'v', 'o', 'x' }, 'j', 'h', opts)
vim.keymap.set({ 'n', 'v', 'o', 'x' }, 'k', 'j', opts)
vim.keymap.set({ 'n', 'v', 'o', 'x', 'i', 'c' }, 'ğ', '[', opts)
vim.keymap.set({ 'n', 'v', 'o', 'x', 'i', 'c' }, 'ü', ']', opts)
vim.keymap.set({ 'n', 'v', 'o', 'x', 'i', 'c' }, 'Ğ', '{', opts)
vim.keymap.set({ 'n', 'v', 'o', 'x', 'i', 'c' }, 'Ü', '}', opts)
vim.keymap.set({ 'n', 'v', 'o', 'x', 'i', 'c' }, 'ş', '$', opts)
vim.keymap.set({ 'n', 'v', 'o', 'x', 'i', 'c' }, 'ö', '/', opts)
vim.keymap.set({ 'n', 'v', 'o', 'x', 'i', 'c' }, 'ç', '#', opts)


-------------------- FILE OPERATIONS --------------------
vim.keymap.set('n', '<C-s>', '<cmd>w<CR>', opts) -- Save file
vim.keymap.set('n', '<leader>sn', '<cmd>noautocmd w<CR>', opts) -- Save w/og autoformat
vim.keymap.set('n', '<C-q>', '<cmd>q<CR>', opts) -- Quit window


-------------------- EDITING --------------------
-- Delete character without overwriting the yank register
vim.keymap.set('n', 'x', '"_x', opts)

-- Stay in indent mode after shifting selection
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Paste over selection without overwriting the yank register
vim.keymap.set('v', 'p', '"_dP', opts)

-- Toggle line wrapping
vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', opts)


-------------------- NAVIGATION --------------------
-- Scroll and keep cursor centered
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- Jump to search result and keep cursor centered
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)


-------------------- WINDOW MANAGEMENT --------------------
vim.keymap.set('n', '<leader>wv', '<C-w>v', opts) -- Split vertically
vim.keymap.set('n', '<leader>wh', '<C-w>s', opts) -- Split horizontally
vim.keymap.set('n', '<leader>ww', '<C-w>=', opts) -- Equalise split dimensions
vim.keymap.set('n', '<leader>wq', ':close<CR>', opts) -- Close current split

-- Navigate between splits (aligned to custom direction system)
vim.keymap.set('n', '<C-ı>', ':wincmd k<CR>', opts) -- Move to upper split
vim.keymap.set('n', '<C-k>', ':wincmd j<CR>', opts) -- Move to lower split
vim.keymap.set('n', '<C-j>', ':wincmd h<CR>', opts) -- Move to left split
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', opts) -- Move to right split

-- Resize splits with arrow keys
vim.keymap.set('n', '<Up>', ':resize -2<CR>', opts) -- Shrink horizontally
vim.keymap.set('n', '<Down>', ':resize +2<CR>', opts) -- Grow horizontally
vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>', opts) -- Shrink vertically
vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>', opts) -- Grow vertically


-------------------- BUFFER MANAGEMENT --------------------
vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts) -- Next buffer
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts) -- Previous buffer
vim.keymap.set('n', '<leader>x', ':bdelete!<CR>', opts) -- Force close buffer
vim.keymap.set('n', '<leader>b', '<cmd>enew<CR>', opts) -- Open new empty buffer


-------------------- TAB MANAGEMENT --------------------
vim.keymap.set('n', '<leader>to', ':tabnew<CR>', opts) -- Open new tab
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', opts) -- Close current tab
vim.keymap.set('n', '<leader>tn', ':tabn<CR>', opts) -- Go to next tab
vim.keymap.set('n', '<leader>tp', ':tabp<CR>', opts) -- Go to previous tab


-------------------- DIAGNOSTICS --------------------
-- Jump to previous diagnostic
vim.keymap.set('n', '[d', function()
  vim.diagnostic.jump { count = -1, float = true }
end, { noremap = true, silent = true, desc = 'Jump to previous diagnostic' })

-- Jump to next diagnostic
vim.keymap.set('n', ']d', function()
  vim.diagnostic.jump { count = 1, float = true }
end, { noremap = true, silent = true, desc = 'Jump to next diagnostic' })

-- Show diagnostic in floating window
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { noremap = true, silent = true, desc = 'Show diagnostic in floating window' })

-- Send diagnostics to location list
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { noremap = true, silent = true, desc = 'Send diagnostics to location list' })


-------------------- TERMINAL & EXECUTION --------------------
-- Terminal splits
vim.keymap.set('n', '<leader>tt', '<cmd>vsplit | terminal<CR>', opts)  -- Vertical
vim.keymap.set('n', '<leader>tth', '<cmd>split | terminal<CR>', opts) -- Horizontal

-- Run Python splits (!! If you uncomment this, comment the next block)
-- vim.keymap.set('n', '<leader>rp', '<cmd>vsplit | terminal python3 %<CR>', opts)  -- Vertical
-- vim.keymap.set('n', '<leader>rph', '<cmd>split | terminal python3 %<CR>', opts) -- Horizontal

-- Run Python and keep the terminal open until you press a key
vim.keymap.set('n', '<leader>rp', '<cmd>vsplit | terminal python3 %; read -n 1 -p "Press any key to close..."<CR>', opts)
vim.keymap.set('n', '<leader>rpp', '<cmd>split | terminal python3 %; read -n 1 -p "Press any key to close..."<CR>', opts)

-- Use Esc to exit terminal mode
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], opts)

