return {
  {
    -- Highlight CSV columns in distinct rainbow colors and enable column-aware navigation
    'mechatroner/rainbow_csv',
    ft = { 'csv', 'tsv', 'csv_semicolon', 'csv_whitespace', 'csv_pipe' },
  },
  {
    -- Preview CSV files as an aligned table with :CsvViewToggle
    'hat0uma/csvview.nvim',
    ft = { 'csv', 'tsv', 'csv_semicolon', 'csv_whitespace', 'csv_pipe' },
    opts = {
      parser = {
        async_chunksize = 50, -- keep large files responsive
      },
      view = {
        display_mode = 'highlight', -- underline column separators in-place
      },
    },
    keys = {
      { '<leader>ct', '<cmd>CsvViewToggle<CR>', desc = 'Toggle CSV table view' },
    },
  },
}