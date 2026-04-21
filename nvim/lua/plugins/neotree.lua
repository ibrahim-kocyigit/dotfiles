return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
    {
      's1n7ax/nvim-window-picker',
      version = '2.*',
      config = function()
        require('window-picker').setup {
          filter_rules = {
            include_current_win = false,
            autoselect_one = true,
            bo = {
              filetype = { 'neo-tree', 'neo-tree-popup', 'notify' },
              buftype = { 'terminal', 'quickfix' },
            },
          },
        }
      end,
    },
  },
  config = function()
    require('neo-tree').setup {
      close_if_last_window = false,
      popup_border_style = 'rounded',
      enable_git_status = true,
      enable_diagnostics = true,
      open_files_do_not_replace_types = { 'terminal', 'trouble', 'qf' },
      sort_case_insensitive = false,
      default_component_configs = {
        indent = {
          indent_size = 2,
          padding = 1,
          with_markers = true,
          indent_marker = '│',
          last_indent_marker = '└',
        },
        icon = {
          folder_empty = '  ',
          default = '*',
        },
        git_status = {
          symbols = {
            deleted = '✖',
            renamed = '  ',
            unstaged = '  ',
          },
        },
      },
      window = {
        position = 'left',
        width = 35,
        mappings = {
          ['<space>'] = 'none', -- Protect your Leader key

          -- Movement (Sentencing: ı=Up, k=Down, j=Left, l=Right)
          ['ı'] = 'prev_node',   -- Up
          ['k'] = 'next_node',   -- Down
          ['j'] = 'close_node',  -- Left (Collapses folder)
          ['l'] = 'open',        -- Right (Opens folder or file)

          -- Standard Actions
          ['<cr>'] = 'open',
          ['S'] = 'open_split',
          ['s'] = 'open_vsplit',
          ['t'] = 'open_tabnew',
          ['w'] = 'open_with_window_picker',
          ['q'] = 'close_window',
          ['a'] = { 'add', config = { show_path = 'none' } },
          ['d'] = 'delete',
          ['r'] = 'rename',
          ['?'] = 'show_help',
        },
      },
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = {
            '.DS_Store', 'thumbs.db', 'node_modules', '__pycache__',
            '.git', '.venv', '.ipynb_checkpoints',
          },
        },
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
      },
    }

    -- --- CO-LOCATED KEYMAPS (Module-Action-Option) ---
    local opts = { noremap = true, silent = true }

    -- [e]xplorer...
    -- [t]oggle
    vim.keymap.set('n', '<leader>et', '<cmd>Neotree toggle<CR>', 
        vim.tbl_extend('force', opts, { desc = '[t]oggle' }))
    
    -- [f]ocus
    vim.keymap.set('n', '<leader>ef', '<cmd>Neotree focus<CR>', 
        vim.tbl_extend('force', opts, { desc = '[f]ocus' }))

    -- [g]it status (float)
    vim.keymap.set('n', '<leader>eg', '<cmd>Neotree float git_status<CR>', 
        vim.tbl_extend('force', opts, { desc = '[g]it status' }))
  end,
}

