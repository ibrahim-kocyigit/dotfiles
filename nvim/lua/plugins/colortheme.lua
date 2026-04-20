return {
  {
    'navarasu/onedark.nvim',
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('onedark').setup {
        style = 'darker',
        diagnostics = {
          darker = true,
        },
        lualine = {
          transparent = false,
        },
        code_style = {
          keywords = 'italic',
          functions = 'none',
          strings = 'none',
          variables = 'none',
          comments = 'italic',
        },
      }
      require('onedark').load()
    end,
  },
}