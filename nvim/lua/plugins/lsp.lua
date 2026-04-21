return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'mason-org/mason.nvim', config = true },
    'mason-org/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    {
      'j-hui/fidget.nvim',
      opts = {
        notification = {
          window = {
            winblend = 0,
          },
        },
      },
    },
  },
  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc, mode)
          mode = mode or 'n'
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        -- Standard goto keys (no leader — these are universal LSP conventions)
        map('gd', require('telescope.builtin').lsp_definitions,     '[g]oto [d]efinition')
        map('gr', require('telescope.builtin').lsp_references,      '[g]oto [r]eferences')
        map('gI', require('telescope.builtin').lsp_implementations,  '[g]oto [I]mplementation')
        map('gD', vim.lsp.buf.declaration,                          '[g]oto [D]eclaration')

        -- [s]earch [l]sp
        map('<leader>slt', require('telescope.builtin').lsp_type_definitions,        '[t]ype definition')
        map('<leader>slw', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[w]orkspace symbols')
        -- Note: <leader>sls (document symbols) is already defined in telescope.lua

        -- [l]sp actions
        map('<leader>lr', vim.lsp.buf.rename,       '[r]ename')
        map('<leader>la', vim.lsp.buf.code_action,  '[a]ction', { 'n', 'x' })

        local client = vim.lsp.get_client_by_id(event.data.client_id)

        -- Document highlight on cursor hold
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
          local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })
          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })
          vim.api.nvim_create_autocmd('LspDetach', {
            group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds { group = 'lsp-highlight', buffer = event2.buf }
            end,
          })
        end

        -- [u]i [t]oggle [h]ints  ← fits under existing <leader>ut group
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
          map('<leader>uth', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
          end, '[h]ints')
        end
      end,
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    local servers = {
      basedpyright = {
        settings = {
          basedpyright = {             -- ✅ fixed: was 'python'
            analysis = {
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              diagnosticMode = 'openFilesOnly',
            },
          },
        },
      },
ruff = {
  on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = true
  end,
},
      dockerls   = {},
      sqlls      = {},
      terraformls = {},
      jsonls     = {},
      yamlls     = {},
      marksman   = {},
      lua_ls = {
        settings = {
          Lua = {
            completion = { callSnippet = 'Replace' },
            runtime = { version = 'LuaJIT' },
            workspace = {
              checkThirdParty = false,
              library = vim.api.nvim_get_runtime_file('', true),
            },
            diagnostics = {
              globals = { 'vim' },
              disable = { 'missing-fields' },
            },
            format = { enable = false },
          },
        },
      },
    }

    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
        -- 'stylua' removed, now managed by mason-null-ls
        }
    )

    require('mason-lspconfig').setup()   -- ✅ fixed: must be called for name translation
    require('mason-tool-installer').setup { ensure_installed = ensure_installed }

    for server, cfg in pairs(servers) do
      cfg.capabilities = vim.tbl_deep_extend('force', {}, capabilities, cfg.capabilities or {})
      vim.lsp.config(server, cfg)
      vim.lsp.enable(server)
    end
  end,
}
