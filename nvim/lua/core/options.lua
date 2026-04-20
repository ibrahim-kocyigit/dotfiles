--> LINE NUMBERS & CURSOR
vim.wo.number = true        -- Show absolute line numbers (false)
vim.o.relativenumber = true -- Show relative line numbers (false)
vim.o.numberwidth = 4       -- Width of the line number column (4)
vim.o.cursorline = false    -- Do not highlight the current line (false)
vim.wo.signcolumn = 'yes'   -- Always show the sign column ('auto')

--> INDENTATION & TABS
vim.o.autoindent = true     -- Inherit indentation from the current line (true)
vim.o.smartindent = true    -- Insert indentation based on code syntax (false)
vim.o.breakindent = true    -- Wrapped lines continue at the same indentation level (false)
vim.o.shiftwidth = 4        -- Spaces used per indentation level (8)
vim.o.tabstop = 4           -- Spaces a tab character represents visually (8)
vim.o.softtabstop = 4       -- Spaces inserted or removed when pressing Tab/Backspace (0)
vim.o.expandtab = true      -- Insert spaces instead of tab characters (false)

--> SEARCH
vim.o.ignorecase = true     -- Case-insensitive search by default (false)
vim.o.smartcase = true      -- Override ignorecase when query contains uppercase (false)
vim.o.hlsearch = false      -- Do not highlight matches after search (true)

--> APPEARANCE & UI
vim.opt.termguicolors = true     -- Enable 24-bit RGB color in the terminal (false)
vim.o.wrap = false               -- Do not wrap long lines (true)
vim.o.linebreak = true           -- Break wrapped lines at word boundaries (false)
vim.o.showmode = false           -- Do not display current mode in the command line (true)
vim.o.showtabline = 2            -- Always show the tab bar (1)
vim.o.pumheight = 10             -- Maximum number of items in the popup menu (0)
vim.o.conceallevel = 0           -- Show all characters as written; disable concealment (1)
vim.o.cmdheight = 1              -- Number of lines reserved for the command line (1)
vim.o.colorcolumn = '88'         -- Highlight the column at line length limit (Black std)
vim.o.list = true                -- Render invisible characters as visible symbols (false)
vim.o.listchars = 'trail:·,nbsp:␣' -- Symbols used to represent trailing and non-breaking spaces

--> SPLITS & SCROLLING
vim.o.scrolloff = 8           -- Minimum lines to keep visible above and below the cursor (0)
vim.o.sidescrolloff = 8       -- Minimum columns to keep visible on either side of the cursor (0)
vim.o.splitbelow = true       -- Open horizontal splits below the current window (false)
vim.o.splitright = true       -- Open vertical splits to the right of the current window (false)

--> MOUSE & CLIPBOARD
vim.o.mouse = 'a'               -- Enable mouse support in all modes ('')
vim.o.clipboard = 'unnamedplus' -- Use the system clipboard for all yank and paste operations ('')

--> FILE HANDLING & BACKUP
vim.o.fileencoding = 'utf-8'  -- Encoding used when writing files ('utf-8')
vim.o.swapfile = false        -- Disable swap file creation (true)
vim.o.backup = false          -- Disable backup file creation (false)
vim.o.writebackup = false     -- Disable write backup; allow editing files open elsewhere (true)
vim.o.undofile = true         -- Persist undo history across sessions (false)

--> CODE FOLDING
vim.o.foldmethod = 'indent'   -- Fold code based on indentation level ('manual')
vim.o.foldlevel = 99          -- Open all folds by default (0)

--> LINE LENGTH
vim.o.textwidth = 88        -- Maximum line length before auto-wrapping (Black std)

--> PERFORMANCE & TIMING
vim.o.updatetime = 250      -- Milliseconds of inactivity before writing the swap file (4000)
vim.o.timeoutlen = 500      -- Milliseconds to wait for a key sequence to complete (1000)

--> EDITING BEHAVIOUR
vim.o.backspace = 'indent,eol,start'    -- Allow backspace to delete indentation, line breaks, and pre-insert text ('indent,eol,start')
vim.o.whichwrap = 'bs<>[]hl'            -- Allow horizontal movement keys to wrap across lines ('b,s')
vim.o.completeopt = 'menuone,noselect'  -- Show completion menu without auto-selecting a match ('menu,preview')

--> SPELL CHECKING PER FILETYPE
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'markdown', 'rst', 'gitcommit' },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = 'en_us'
  end,
})

--> VIM/NEOVIM COMPATIBILITY & MISC
vim.opt.shortmess:append 'c'                         -- Suppress completion menu messages in the command line
vim.opt.iskeyword:append '-'                         -- Treat hyphenated words as a single keyword in searches
vim.opt.formatoptions:remove { 'c', 'r', 'o' }       -- Disable automatic comment leader insertion on new lines
vim.opt.runtimepath:remove '/usr/share/vim/vimfiles' -- Exclude Vim's runtime path to isolate Neovim plugins

--> PYTHON PROVIDER
-- Points Neovim to a dedicated Python venv that has pynvim and jupyter_client installed.
-- This is separate from your project venvs — it is Neovim's internal Python provider,
-- used by plugins like molten.nvim to communicate with Python/Jupyter kernels.
-- Switch project venvs independently with <leader>pv (venv-selector).
-- Setup: uv venv ~/.venv/neovim && uv pip install --python ~/.venv/neovim/bin/python pynvim jupyter_client cairosvg plotly kaleido
vim.g.python3_host_prog = vim.fn.expand '~/.venv/neovim/bin/python'