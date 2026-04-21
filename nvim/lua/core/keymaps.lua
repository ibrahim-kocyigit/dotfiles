----------------------------------------------------
-------------------- ESSENTIALS --------------------
----------------------------------------------------
-- !! LEADER KEY (Must stay at top)
vim.g.mapleader = ' '
vim.g.maplocalleader = [[\\]]
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- SHARED OPTIONS 
local opts = { noremap = true, silent = true }

-- TURKISH KEYBOARD REMAPS
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

-- EXPRESS LANES (Fast access for high-frequency actions)
-- Express Save
vim.keymap.set('n', '<C-s>', '<cmd>update<CR>', opts)
-- In Insert mode: Save and stay in Insert mode exactly where you are
vim.keymap.set('i', '<C-s>', '<cmd>update<CR>', opts)

-- Express Quit
vim.keymap.set('n', '<C-q>', '<cmd>confirm q<CR>', opts)
-- In Insert mode: Save and quit
vim.keymap.set('i', '<C-q>', '<Esc><cmd>confirm q<CR>', opts)

----------------------------------------------------
-------------------- NAVIGATION --------------------
----------------------------------------------------
-- Scroll and keep cursor centered
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- Jump to search result and keep cursor centered
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

-- Cycle through Tabs instead of Buffers
vim.keymap.set('n', '<Tab>', '<cmd>tabnext<CR>', opts)
vim.keymap.set('n', '<S-Tab>', '<cmd>tabprevious<CR>', opts)

-- Navigate between splits (aligned to custom direction system)
vim.keymap.set('n', '<C-ı>', ':wincmd k<CR>', opts) -- Move to upper split
vim.keymap.set('n', '<C-k>', ':wincmd j<CR>', opts) -- Move to lower split
vim.keymap.set('n', '<C-j>', ':wincmd h<CR>', opts) -- Move to left split
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', opts) -- Move to right split


----------------------------------------------------
-------------------- EDITING -----------------------
----------------------------------------------------
-- Delete character without overwriting the yank register
vim.keymap.set('n', 'x', '"_x', opts)

-- Stay in indent mode after shifting selection
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Paste over selection without overwriting the yank register
vim.keymap.set('v', 'p', '"_dP', opts)

-- Toggle line wrapping
vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', opts)


----------------------------------------------------
------------------- MODULES ------------------------
----------------------------------------------------

------------------- [f]ile -------------------------
-- [s]ave...
---- [s]tandard (formatted)
vim.keymap.set('n', '<leader>fss', '<cmd>update<CR>', 
    vim.tbl_extend('force', opts, { desc = '[s]tandard' }))
---- [m]essy (no autoformat)
vim.keymap.set('n', '<leader>fsm', '<cmd>noautocmd w<CR>', 
    vim.tbl_extend('force', opts, { desc = '[m]essy' }))
------ [a]ll (save all buffers)
vim.keymap.set('n', '<leader>fsa', '<cmd>wa<CR>', 
    vim.tbl_extend('force', opts, { desc = '[a]ll' }))

-- [o]pen...
---- [n]ew empty
vim.keymap.set('n', '<leader>fon', '<cmd>enew<CR>', 
    vim.tbl_extend('force', opts, { desc = '[n]ew empty' }))

-- [p]ath...
---- [c]opy path
vim.keymap.set('n', '<leader>fpc', '<cmd>let @+ = expand("%:p")<CR>', 
    vim.tbl_extend('force', opts, { desc = '[c]opy' }))
---- [r]ename file
vim.keymap.set('n', '<leader>fpr', ':rename ', 
    { noremap = true, silent = false, desc = '[r]ename' })

-- [q]uit...
---- [q]uit window (safe)
vim.keymap.set('n', '<leader>fqw', '<cmd>confirm q<CR>', 
    vim.tbl_extend('force', opts, { desc = '[w]indow' }))
---- quit [a]ll (safe)
vim.keymap.set('n', '<leader>fqa', '<cmd>confirm qa<CR>', 
    vim.tbl_extend('force', opts, { desc = '[a]ll' }))


------------------- [b]uffer -----------------------
-- [g]o...
---- [n]ext buffer
vim.keymap.set('n', '<leader>bgn', '<cmd>bnext<CR>', 
    vim.tbl_extend('force', opts, { desc = '[n]ext' }))
---- [p]revious buffer
vim.keymap.set('n', '<leader>bgp', '<cmd>bprevious<CR>', 
    vim.tbl_extend('force', opts, { desc = '[p]revious' }))

-- [o]pen...
---- [n]ew empty
vim.keymap.set('n', '<leader>bon', '<cmd>enew<CR>', 
    vim.tbl_extend('force', opts, { desc = '[n]ew' }))

-- [c]lose...
---- [c]urrent buffer (safe)
vim.keymap.set('n', '<leader>bcc', '<cmd>bdelete<CR>', 
    vim.tbl_extend('force', opts, { desc = '[c]urrent' }))
---- [f]orce close (discard changes)
vim.keymap.set('n', '<leader>bcf', '<cmd>bdelete!<CR>', 
    vim.tbl_extend('force', opts, { desc = '[f]orce' }))
---- [o]thers (close all but current)
vim.keymap.set('n', '<leader>bco', '<cmd>%bd|e#|bd#<CR>', 
    vim.tbl_extend('force', opts, { desc = '[o]thers' }))


------------------- [t]ab -------------------------

-- [o]pen new tab
vim.keymap.set('n', '<leader>to', '<cmd>tabnew<CR>', 
    vim.tbl_extend('force', opts, { desc = '[o]pen' }))

-- [c]lose current tab
vim.keymap.set('n', '<leader>tc', '<cmd>tabclose<CR>', 
    vim.tbl_extend('force', opts, { desc = '[c]lose' }))


------------------- [w]indow -----------------------

-- [o]pen... (previously split)
---- [v]ertical split
vim.keymap.set('n', '<leader>wov', '<C-w>v', 
    vim.tbl_extend('force', opts, { desc = '[v]ertical' }))
---- [h]orizontal split
vim.keymap.set('n', '<leader>woh', '<C-w>s', 
    vim.tbl_extend('force', opts, { desc = '[h]orizontal' }))

-- [r]eset...
vim.keymap.set('n', '<leader>wr', '<C-w>=', 
    vim.tbl_extend('force', opts, { desc = '[e]qualize' }))

-- [c]lose...
vim.keymap.set('n', '<leader>wc', '<cmd>close<CR>', 
    vim.tbl_extend('force', opts, { desc = '[c]lose' }))

-- Resize splits with arrow keys
vim.keymap.set('n', '<Up>', '<cmd>resize -2<CR>', opts)
vim.keymap.set('n', '<Down>', '<cmd>resize +2<CR>', opts)
vim.keymap.set('n', '<Left>', '<cmd>vertical resize -2<CR>', opts)
vim.keymap.set('n', '<Right>', '<cmd>vertical resize +2<CR>', opts)


------------------- [d]iagnostic -------------------

-- [g]o..
---- [n]ext diagnostic
vim.keymap.set('n', '<leader>dgn', function()
  vim.diagnostic.jump { count = 1, float = true }
end, vim.tbl_extend('force', opts, { desc = '[n]ext' }))

---- [p]revious diagnostic
vim.keymap.set('n', '<leader>dgp', function()
  vim.diagnostic.jump { count = -1, float = true }
end, vim.tbl_extend('force', opts, { desc = '[p]revious' }))

-- [s]how...
---- [f]loating window
vim.keymap.set('n', '<leader>dsf', vim.diagnostic.open_float, 
    vim.tbl_extend('force', opts, { desc = '[f]loating' }))

---- [l]ist all in file
vim.keymap.set('n', '<leader>dsl', vim.diagnostic.setloclist, 
    vim.tbl_extend('force', opts, { desc = '[l]ist' }))


------------------- [u]i ---------------------------

-- [t]oggle...
---- [w]rap lines
vim.keymap.set('n', '<leader>utw', '<cmd>set wrap!<CR>', 
    vim.tbl_extend('force', opts, { desc = '[w]rap' }))

---- [n]umbers
vim.keymap.set('n', '<leader>utn', '<cmd>set number! relativenumber!<CR>', 
    vim.tbl_extend('force', opts, { desc = '[n]umbers' }))

-- [c]lear...
---- [s]earch highlights
vim.keymap.set('n', '<leader>ucs', '<cmd>nohlsearch<CR>', 
    vim.tbl_extend('force', opts, { desc = '[s]earch' }))

