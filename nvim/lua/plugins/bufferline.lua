return {
  'akinsho/bufferline.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',  -- vim-bbye dropped
  },
  config = function()
    require('bufferline').setup {
      options = {
        mode = 'buffers',
        themable = true,
        numbers = 'none',
        close_command = 'bdelete! %d',          -- native, no vim-bbye needed
        buffer_close_icon = '✗',
        close_icon = '✗',
        path_components = 1,
        modified_icon = '●',
        left_trunc_marker = '',
        right_trunc_marker = '',
        max_name_length = 20,
        max_prefix_length = 20,
        tab_size = 21,
        enforce_regular_tabs = false,           -- allow tab_size to take effect
        diagnostics = false,
        diagnostics_update_in_insert = false,
        color_icons = true,
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        persist_buffer_sort = true,
        separator_style = { '│', '│' },
        always_show_bufferline = true,
        show_tab_indicators = false,
        indicator = {
          style = 'none',
        },
        icon_pinned = '󰐃',
        minimum_padding = 1,
        maximum_padding = 5,
        maximum_length = 25,                    -- consistent with max_name_length
        sort_by = 'insert_at_end',
      },
      highlights = {
        separator = {
          fg = '#434C5E',
        },
        buffer_selected = {
          bold = true,
          italic = false,
        },
      },
    }

    -- CO-LOCATED KEYMAPS (Module-Action-Option)
    local opts = { noremap = true, silent = true }

    -- [b]uffer [g]o - use bufferline cycle to respect visual order
    vim.keymap.set('n', '<leader>bgn', '<cmd>BufferLineCycleNext<CR>',
        vim.tbl_extend('force', opts, { desc = '[n]ext' }))
    vim.keymap.set('n', '<leader>bgp', '<cmd>BufferLineCyclePrev<CR>',
        vim.tbl_extend('force', opts, { desc = '[p]revious' }))

    -- [b]uffer [p]in
    vim.keymap.set('n', '<leader>bpt', '<cmd>BufferLineTogglePin<CR>',
        vim.tbl_extend('force', opts, { desc = '[t]oggle' }))
  end,
}
