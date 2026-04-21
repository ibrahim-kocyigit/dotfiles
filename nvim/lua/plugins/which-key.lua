return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  config = function()
    local wk = require 'which-key'

    wk.setup {
      icons = {
        breadcrumb = '»',
        separator = '➜',
        group = '+',
        rules = false,
      },
    }

    wk.add {

      -- [f]ile module
      { '<leader>f', group = '[f]ile' },
      { '<leader>fs', group = '[s]ave' },
      { '<leader>fo', group = '[o]pen' },
      { '<leader>fp', group = '[p]ath' },
      { '<leader>fq', group = '[q]uit' },

      -- [b]uffer module
      { '<leader>b', group = '[b]uffer' },
      { '<leader>bg', group = '[g]o' },
      { '<leader>bo', group = '[o]pen' },
      { '<leader>bc', group = '[c]lose' },
      { '<leader>bp', group = '[p]in' },

      -- [t]ab module
      { '<leader>t', group = '[t]ab' },

      -- [w]indow module
      { '<leader>w', group = '[w]indow' },
      { '<leader>wo', group = '[o]pen' },

      -- [T]erminal module
      { '<leader>T', group = '[T]erminal' },
      { '<leader>Tt', desc = '[t]oggle' },
      { '<leader>To', group = '[o]pen' },
      { '<leader>Tp', group = '[p]ython' },

      -- [d]iagnostic module
      { '<leader>d', group = '[d]iagnostic' },
      { '<leader>dg', group = '[g]o' },
      { '<leader>ds', group = '[s]how' },
      { '<leader>dl', group = '[l]sp' }, -- ✅ new: trouble LSP sub-group

      -- [u]i module
      { '<leader>u', group = '[u]i' },
      { '<leader>ut', group = '[t]oggle' },
      { '<leader>uth', desc = '[h]ints' },
      { '<leader>uc', group = '[c]lear' },

      -- [s]earch module
      { '<leader>s', group = '[s]earch' },
      { '<leader>ss', group = '[s]cope' },
      { '<leader>sl', group = '[l]sp' },
      { '<leader>slt', desc = '[t]ype definition' },
      { '<leader>slw', desc = '[w]orkspace symbols' },

      -- [g]it module
      { '<leader>g', group = '[g]it' },
      { '<leader>gs', group = '[s]earch' },
      { '<leader>gh', group = '[h]unk' },
      { '<leader>gb', group = '[b]lame' },
      { '<leader>gt', group = '[t]oggle' },

      -- [e]xplorer module
      { '<leader>e', group = '[e]xplorer' },

      -- [l]sp module
      { '<leader>l', group = '[l]sp' },
      { '<leader>la', desc = '[a]ction' },
      { '<leader>lr', desc = '[r]ename' },
    }
  end,
}
