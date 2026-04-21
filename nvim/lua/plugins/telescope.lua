return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function() return vim.fn.executable 'make' == 1 end,
    },
    'nvim-telescope/telescope-ui-select.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    local actions = require 'telescope.actions'
    local builtin = require 'telescope.builtin'
    local opts = { noremap = true, silent = true }

    require('telescope').setup {
      defaults = {
        mappings = {
          i = {
            ['<C-ı>'] = actions.move_selection_previous, -- Up
            ['<C-k>'] = actions.move_selection_next,     -- Down
            ['<C-l>'] = actions.select_default,          -- Open
          },
          n = {
            ['q'] = actions.close,
            ['ı'] = actions.move_selection_previous,
            ['k'] = actions.move_selection_next,
            ['l'] = actions.select_default,
          },
        },
      },
      pickers = {
        find_files = {
          file_ignore_patterns = { 'node_modules', '%.git', '%.venv' },
          hidden = true,
        },
        live_grep = {
          file_ignore_patterns = { 'node_modules', '.git', '.venv' },
          additional_args = function(_)
            return { '--hidden' }
          end,
        },
        buffers = {
          initial_mode = 'normal',
          sort_lastused = true,
          mappings = {
            n = {
              ['d'] = actions.delete_buffer,
              ['l'] = actions.select_default,
            },
          },
        },
        marks = {
          initial_mode = 'normal',
        },
        oldfiles = {
          initial_mode = 'normal',
        },
        git_files = {
          previewer = false,
        },
      },
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    -- --- [s]earch Module ---
    -- [s]earch [s]cope...
    vim.keymap.set('n', '<leader>ssf', builtin.find_files, vim.tbl_extend('force', opts, { desc = '[f]iles' }))
    vim.keymap.set('n', '<leader>ssw', builtin.live_grep, vim.tbl_extend('force', opts, { desc = '[w]ords (grep)' }))
    vim.keymap.set('n', '<leader>ssr', builtin.oldfiles, vim.tbl_extend('force', opts, { desc = '[r]ecent' }))
    vim.keymap.set('n', '<leader>ssb', builtin.buffers, vim.tbl_extend('force', opts, { desc = '[b]uffers' }))
    vim.keymap.set('n', '<leader>ssm', builtin.marks, vim.tbl_extend('force', opts, { desc = '[m]arks' }))
    vim.keymap.set('n', '<leader>ssd', builtin.diagnostics, vim.tbl_extend('force', opts, { desc = '[d]iagnostics' }))

    -- [s]earch [l]sp...
    -- vim.keymap.set('n', '<leader>sls', builtin.lsp_document_symbols, vim.tbl_extend('force', opts, { desc = '[s]ymbols' }))

    -- --- [g]it Module ---
    -- [g]it [s]earch...
    vim.keymap.set('n', '<leader>gsf', builtin.git_files, vim.tbl_extend('force', opts, { desc = '[f]iles' }))
    vim.keymap.set('n', '<leader>gsc', builtin.git_commits, vim.tbl_extend('force', opts, { desc = '[c]ommits' }))
    vim.keymap.set('n', '<leader>gsb', builtin.git_branches, vim.tbl_extend('force', opts, { desc = '[b]ranches' }))
  end,
}
