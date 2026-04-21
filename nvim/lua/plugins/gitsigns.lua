-- Adds git related signs to the gutter, as well as utilities for managing changes
return {
  'lewis6991/gitsigns.nvim',
  opts = {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
    signs_staged = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
    on_attach = function(bufnr)
      local gs = require 'gitsigns' -- ✅ fixed: was package.loaded.gitsigns

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation (standard vim diff override — expr pattern is intentional)
      map('n', ']c', function()
        if vim.wo.diff then
          return ']c'
        end
        vim.schedule(function()
          gs.next_hunk()
        end)
        return '<Ignore>'
      end, { expr = true, desc = 'Jump to next hunk' })

      map('n', '[c', function()
        if vim.wo.diff then
          return '[c'
        end
        vim.schedule(function()
          gs.prev_hunk()
        end)
        return '<Ignore>'
      end, { expr = true, desc = 'Jump to previous hunk' })

      -- [g]it [h]unk actions
      map('n', '<leader>ghs', gs.stage_hunk, { desc = '[s]tage' })
      map('n', '<leader>ghr', gs.reset_hunk, { desc = '[r]eset' })
      map('v', '<leader>ghs', function()
        gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, { desc = '[s]tage' })
      map('v', '<leader>ghr', function()
        gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, { desc = '[r]eset' })
      map('n', '<leader>ghS', gs.stage_buffer, { desc = '[S]tage buffer' })
      map('n', '<leader>ghR', gs.reset_buffer, { desc = '[R]eset buffer' })
      map('n', '<leader>ghp', gs.preview_hunk, { desc = '[p]review' })
      map('n', '<leader>ghd', gs.diffthis, { desc = '[d]iff this' })

      -- [g]it [b]lame
      map('n', '<leader>gbl', function()
        gs.blame_line { full = true }
      end, { desc = '[l]ine' })

      -- [g]it [t]oggle
      map('n', '<leader>gtb', gs.toggle_current_line_blame, { desc = '[b]lame' })
    end,
  },
}

