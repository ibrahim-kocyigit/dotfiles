------------------------------------------------------------
------------------------- OPTIONS --------------------------
------------------------------------------------------------

-- LINE NUMBERS & CURSOR
vim.opt.number = true -- show absolute line numbers?
vim.opt.relativenumber = true -- show relative line numbers?
vim.opt.numberwidth = 4 -- width of the line number column
vim.opt.cursorline = false -- highlight the current line?
vim.opt.signcolumn = 'yes' -- always show the sign column

-- INDENTATION & TABS
vim.opt.autoindent = true -- inherit indentation from the current line?
vim.opt.smartindent = true -- insert indentation based on code syntax?
vim.opt.breakindent = true -- wrapped lines continue at the same indentation level?
vim.opt.shiftwidth = 4 -- spaces used per indentation level
vim.opt.tabstop = 4 -- spaces a tab character represents visually
vim.opt.softtabstop = 4 -- spaces inserted or removed when pressing Tab/Backspace
vim.opt.expandtab = true -- insert spaces instead of tab characters?

-- SEARCH
vim.opt.ignorecase = true -- case-insensitive search by default?
vim.opt.smartcase = true -- override ignorecase when query contains uppercase?
vim.opt.hlsearch = false -- highlight matches after search?
vim.opt.incsearch = true -- show matches as you type?

-- APPEARANCE & UI
vim.opt.termguicolors = true -- enable 24-bit RGB color in the terminal?
vim.opt.wrap = false -- wrap long lines?
vim.opt.linebreak = true -- break wrapped lines at word boundaries?
vim.opt.showmode = false -- display current mode in the command line?
vim.opt.showtabline = 2 -- always show the tab bar
vim.opt.pumheight = 10 -- maximum number of items in the popup menu
vim.opt.pumblend = 10 -- popup menu transparency
vim.opt.conceallevel = 0 -- show all characters as written; disable concealment
vim.opt.cmdheight = 1 -- number of lines reserved for the command line
vim.opt.colorcolumn = '88' -- highlight the column at line length limit
vim.opt.list = true -- render invisible characters as visible symbols?
vim.opt.listchars = 'trail:·,nbsp:␣' -- symbols used to represent trailing and non-breaking spaces
vim.opt.showmatch = true -- highlight matching brackets?
vim.opt.winblend = 0 -- floating window transparency
vim.opt.lazyredraw = true -- don't redraw during macros?
vim.opt.synmaxcol = 300 -- syntax highlighting limit
vim.opt.fillchars = { eob = " " } -- hide ~ on empty lines

-- SPLITS & SCROLLING
vim.opt.scrolloff = 8 -- minimum lines to keep visible above and below the cursor
vim.opt.sidescrolloff = 8 -- minimum columns to keep visible on either side of the cursor
vim.opt.splitbelow = true -- open horizontal splits below the current window?
vim.opt.splitright = true -- open vertical splits to the right of the current window?

-- MOUSE & CLIPBOARD
vim.opt.mouse = 'a' -- enable mouse support in all modes
vim.opt.clipboard = 'unnamedplus' -- use the system clipboard for all yank and paste operations

-- FILE HANDLING & BACKUP
vim.opt.fileencoding = 'utf-8' -- encoding used when writing files
vim.opt.swapfile = false -- create swap file?
vim.opt.backup = false -- create backup file?
vim.opt.writebackup = false -- write to backup file; allow editing files open elsewhere?
vim.opt.undofile = true -- persist undo history across sessions?
vim.opt.autoread = true -- auto-reload changes outside neovim?
vim.opt.autowrite = false -- auto-save?

-- CODE FOLDING
vim.opt.foldmethod = 'expr' -- use expression for folding with treesitter
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()' -- use treesitter for folding
vim.opt.foldlevel = 99 -- open all folds by default

-- LINE LENGTH
vim.opt.textwidth = 88 -- maximum line length before auto-wrapping

-- PERFORMANCE & TIMING
vim.opt.updatetime = 250 -- milliseconds of inactivity before writing the swap file
vim.opt.timeoutlen = 500 -- milliseconds to wait for a key sequence to complete
vim.opt.ttimeoutlen = 50 -- key code timeout

-- EDITING BEHAVIOUR
vim.opt.backspace = 'indent,eol,start' -- allow backspace to delete indentation, line breaks, and pre-insert text
vim.opt.whichwrap = 'bs<>[]hl' -- allow horizontal movement keys to wrap across lines
vim.opt.completeopt = 'menuone,noinsert,noselect' -- show completion menu without auto-selecting a match
vim.opt.hidden = true -- allow hidden buffers?
vim.opt.errorbells = false -- no error sounds?
vim.opt.autochdir = false -- auto-change directories?
vim.opt.path:append("**") -- include subdirs in search
vim.opt.selection = "inclusive" -- include last char in selection
vim.opt.modifiable = true -- allow buffer modifications?
vim.opt.encoding = "utf-8" -- set encoding
vim.opt.diffopt:append("linematch:60") -- improve diff display

-- SPELL CHECKING PER FILETYPE
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'markdown', 'rst', 'gitcommit' },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = 'en_us'
  end,
})

-- VIM/NEOVIM COMPATIBILITY & MISC
vim.opt.shortmess:append 'c' -- suppress completion menu messages in the command line
vim.opt.iskeyword:append '-' -- treat hyphenated words as a single keyword in searches
vim.opt.formatoptions:remove { 'c', 'r', 'o' } -- disable automatic comment leader insertion on new lines
vim.opt.runtimepath:remove '/usr/share/vim/vimfiles' -- exclude Vim's runtime path to isolate Neovim plugins

-- PROVIDERS
vim.g.python3_host_prog = vim.fn.expand '~/.venv/neovim/bin/python'
vim.g.loaded_node_provider = 0 -- disable Node provider
vim.g.loaded_perl_provider = 0 -- disable Perl provider
vim.g.loaded_ruby_provider = 0 -- disable Ruby provider
