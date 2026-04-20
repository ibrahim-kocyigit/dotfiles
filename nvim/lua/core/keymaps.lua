'--> !! LEADER KEY (Must stay at top)
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })


'--> SHARED OPTIONS
local opts = { noremap = true, silent = true }


'--> TURKISH KEYBOARD REMAPS
vim.keymap.set({ 'n', 'v', 'o', 'x' },           'ı', 'k') -- up
vim.keymap.set({ 'n', 'v', 'o', 'x' },           'j', 'h') -- left
vim.keymap.set({ 'n', 'v', 'o', 'x' },           'k', 'j') -- down
vim.keymap.set({ 'n', 'v', 'o', 'x', 'i', 'c' }, 'ğ', '[') -- [
vim.keymap.set({ 'n', 'v', 'o', 'x', 'i', 'c' }, 'ü', ']') -- ]
vim.keymap.set({ 'n', 'v', 'o', 'x', 'i', 'c' }, 'Ğ', '{') -- {
vim.keymap.set({ 'n', 'v', 'o', 'x', 'i', 'c' }, 'Ü', '}') -- }
vim.keymap.set({ 'n', 'v', 'o', 'x', 'i', 'c' }, 'ş', '$') -- end of line
vim.keymap.set({ 'n', 'v', 'o', 'x', 'i', 'c' }, 'ö', '/') -- search forward
vim.keymap.set({ 'n', 'v', 'o', 'x', 'i', 'c' }, 'ç', '#') -- search backward/comment


'--> FILE OPERATIONS
vim.keymap.set('n', '<C-s>',      '<cmd>w<CR>',           opts) -- Save file
vim.keymap.set('n', '<leader>sn', '<cmd>noautocmd w<CR>', opts) -- Save file without triggering autoformat
vim.keymap.set('n', '<C-q>',      '<cmd>q<CR>',           opts) -- Quit window


'--> EDITING
-- Delete character without overwriting the yank register
vim.keymap.set('n', 'x', '"_x', opts)

-- Stay in indent mode after shifting selection
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Paste over selection without overwriting the yank register
vim.keymap.set('v', 'p', '"_dP', opts)

-- Toggle line wrapping
vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', opts)


'--> NAVIGATION
-- Scroll and keep cursor centered
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- Jump to search result and keep cursor centered
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)


'--> WINDOW MANAGEMENT
vim.keymap.set('n', '<leader>v',  '<C-w>v',     opts) -- Split vertically
vim.keymap.set('n', '<leader>h',  '<C-w>s',     opts) -- Split horizontally
vim.keymap.set('n', '<leader>se', '<C-w>=',     opts) -- Equalise split dimensions
vim.keymap.set('n', '<leader>xs', ':close<CR>', opts) -- Close current split

-- Navigate between splits (aligned to custom direction system)
vim.keymap.set('n', '<C-ı>', ':wincmd k<CR>', opts) -- Move to upper split
vim.keymap.set('n', '<C-k>', ':wincmd j<CR>', opts) -- Move to lower split
vim.keymap.set('n', '<C-j>', ':wincmd h<CR>', opts) -- Move to left split
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', opts) -- Move to right split

-- Resize splits with arrow keys
vim.keymap.set('n', '<Up>',    ':resize -2<CR>',          opts) -- Shrink horizontally
vim.keymap.set('n', '<Down>',  ':resize +2<CR>',          opts) -- Grow horizontally
vim.keymap.set('n', '<Left>',  ':vertical resize -2<CR>', opts) -- Shrink vertically
vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>', opts) -- Grow vertically


'--> BUFFER MANAGEMENT
vim.keymap.set('n', '<Tab>',     ':bnext<CR>',    opts) -- Next buffer
vim.keymap.set('n', '<S-Tab>',   ':bprevious<CR>', opts) -- Previous buffer
vim.keymap.set('n', '<leader>x', ':bdelete!<CR>', opts) -- Force close buffer
vim.keymap.set('n', '<leader>b', '<cmd>enew<CR>', opts) -- Open new empty buffer


'--> TAB MANAGEMENT
vim.keymap.set('n', '<leader>to', ':tabnew<CR>',   opts) -- Open new tab
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', opts) -- Close current tab
vim.keymap.set('n', '<leader>tn', ':tabn<CR>',     opts) -- Go to next tab
vim.keymap.set('n', '<leader>tp', ':tabp<CR>',     opts) -- Go to previous tab


'--> DIAGNOSTICS
vim.keymap.set('n', '[d', function()
  vim.diagnostic.jump { count = -1, float = true }
end, { noremap = true, silent = true, desc = 'Jump to previous diagnostic' })

vim.keymap.set('n', ']d', function()
  vim.diagnostic.jump { count = 1, float = true }
end, { noremap = true, silent = true, desc = 'Jump to next diagnostic' })

vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float,
  { noremap = true, silent = true, desc = 'Show diagnostic in floating window' })

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist,
  { noremap = true, silent = true, desc = 'Send diagnostics to location list' })


'--> TERMINAL & EXECUTION (DATA SCIENCE / ML)
-- Open a terminal in a horizontal split (useful for running scripts/REPLs)
vim.keymap.set('n', '<leader>tt', '<cmd>split | terminal<CR>', opts)

-- Run the current Python file in a terminal split
vim.keymap.set('n', '<leader>rp', '<cmd>split | terminal python3 %<CR>',
  { noremap = true, silent = true, desc = 'Run current Python file' })