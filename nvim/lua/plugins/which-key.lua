return {
  'folke/which-key.nvim',
  event = "VeryLazy", -- Loads which-key only when needed
  config = function()
    local wk = require("which-key")
    wk.setup() -- Initializes with default settings

    wk.add({

        -- [f]ile module
        { "<leader>f", group = "[f]ile" },
        { "<leader>fs", group = "[s]ave" },
        { "<leader>fo", group = "[o]pen" },
        { "<leader>fp", group = "[p]ath" },
        { "<leader>fq", group = "[q]uit" },

        -- [b]uffer module
        { "<leader>b", group = "[b]uffer" },
        { "<leader>bg", group = "[g]o" },
        { "<leader>bo", group = "[o]pen" },
        { "<leader>bc", group = "[c]lose" },

        -- [t]ab module
        { "<leader>t", group = "[t]ab" },

        -- [w]indow module
        { "<leader>w", group = "[w]indow" },
        { "<leader>wo", group = "[o]pen" },

        -- [T]erminal module
        { "<leader>T", group = "[T]erminal" },
        { "<leader>To", group = "[o]pen" },
        { "<leader>Tp", group = "[p]ython" },

        -- [d]iagnostic module
        { "<leader>d", group = "[d]iagnostic" },
        { "<leader>dg", group = "[g]o" },
        { "<leader>ds", group = "[s]how" },

        -- [u]i module
        { "<leader>u", group = "[u]i" },
        { "<leader>ut", group = "[t]oggle" },
        { "<leader>uc", group = "[c]lear" },
    })
  end,
}
