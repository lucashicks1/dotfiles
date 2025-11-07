return {
  -- Main LSP Configuration
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',

    { 'j-hui/fidget.nvim', opts = {} }, -- Useful status updates for LSP.
    'saghen/blink.cmp', -- Allows extra capabilities provided by blink.cmp
  },
  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(event)
        -- In this case, we create a function that lets us more easily define mappings specific
        -- for LSP related items. It sets the mode, buffer and description for us each time.
        local map = function(keys, func, desc, mode)
          mode = mode or 'n'
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        local lsp = vim.lsp

        -- Navigation
        map('gr', lsp.buf.references, 'Goto References')
        map('gi', lsp.buf.implementation, 'Goto Implementation')
        map('gd', lsp.buf.definition, 'Goto Definition')
        map('gD', lsp.buf.declaration, 'Goto Declaration')

        -- Editor Actions
        map('<leader>rn', vim.lsp.buf.rename, 'Rename symbol')
        map('<leader>ca', vim.lsp.buf.code_action, 'Show Code Actions', { 'n', 'x' })

        local fmt = function()
          vim.lsp.buf.format { async = true }
        end

        -- Diagnostics
        map('<leader>d', vim.diagnostic.open_float, 'Show Diagnostics')
        map('<leader>q', vim.diagnostic.setloclist, 'Diagnostics Quickfix')

        -- Docs & hints
        map('K', vim.lsp.buf.hover, 'Hover Information')

        -- LSP Server Commands
        map('<leader>li', '<cmd>LspInfo<cr>', 'LSP Info')
        map('<leader>lr', ':LspRestart<cr>', 'LSP Restart')
        map('<leader>ll', ':LspLog<cr>', 'LSP Log')

        -- This function resolves a difference between neovim 0.11 and 0.10
        local function client_supports_method(client, method, bufnr)
          if vim.fn.has 'nvim-0.11' == 1 then
            return client:supports_method(method, bufnr)
          else
            return client.supports_method(method, { bufnr = bufnr })
          end
        end

        -- The following two autocommands are used to highlight references of the
        -- word under your cursor when your cursor rests there for a little while.
        local client = vim.lsp.get_client_by_id(event.data.client_id)

        if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_signatureHelp, event.buf) then
          map('<C-s>', vim.lsp.buf.signature_help, 'Show signature help')
        end

        if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
          local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
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
            group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
            end,
          })
        end
      end,
    })

    local capabilities = require('blink.cmp').get_lsp_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    -- Diagnostic Config
    -- See :help vim.diagnostic.Opts
    vim.diagnostic.config {
      severity_sort = true,
      float = { border = 'rounded', source = 'if_many' },
      underline = { severity = vim.diagnostic.severity.ERROR },
      signs = vim.g.have_nerd_font and {
        text = {
          [vim.diagnostic.severity.ERROR] = '󰅚 ',
          [vim.diagnostic.severity.WARN] = '󰀪 ',
          [vim.diagnostic.severity.INFO] = '󰋽 ',
          [vim.diagnostic.severity.HINT] = '󰌶 ',
        },
      } or {},
      virtual_text = {
        source = 'if_many',
        spacing = 2,
        format = function(diagnostic)
          local diagnostic_message = {
            [vim.diagnostic.severity.ERROR] = diagnostic.message,
            [vim.diagnostic.severity.WARN] = diagnostic.message,
            [vim.diagnostic.severity.INFO] = diagnostic.message,
            [vim.diagnostic.severity.HINT] = diagnostic.message,
          }
          return diagnostic_message[diagnostic.severity]
        end,
      },
    }

    -- LSP Server Configs
    -- lua: recognize "vim" and "mp" global
    vim.lsp.config('lua_ls', {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim', 'mp' },
          },
        },
      },
    })

    vim.lsp.config('tinymist', {
      settings = {
        formatterMode = 'typstyle',
        exportPdf = 'never',
        lint = {
          enabled = true,
          when = 'onSave',
        },
      },
    })

    -- Python Pyrefly
    -- vim.lsp.config('pyrefly', {
    --   settings = {
    --     displayTypeErrors = 'force-on', -- I always want it to yell at me
    --   },
    -- })

    -- Python Ruff
    vim.lsp.config('ruff', {
      capabilities = {
        general = {
          positionEncodings = { 'utf-16' },
        },
      },
    })
    vim.lsp.config('roslyn', {
      settings = {
        ['csharp|inlay_hints'] = {
          csharp_enable_inlay_hints_for_implicit_object_creation = true,
          csharp_enable_inlay_hints_for_implicit_variable_types = true,
        },
        ['csharp|code_lens'] = {
          dotnet_enable_references_code_lens = true,
        },
      },
    })
  end,
}
