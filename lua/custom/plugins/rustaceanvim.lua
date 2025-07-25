-- Rustaceanvim plugin for enhanced Rust development in Neovim
return {
  'mrcjkb/rustaceanvim',
  version = '^6', -- Recommended to pin to a major version
  lazy = false, -- This plugin is already lazy
  ft = { 'rust' }, -- Load on Rust files
  init = function()
    vim.g.rustaceanvim = {
      -- Plugin configuration
      tools = {},
      -- LSP configuration
      server = {
        on_attach = function(_, bufnr)
          -- you can also put keymaps in here
          local map = require('utils').local_map(bufnr)
          map('go', '<cmd>RustLsp openCargo<CR>', '[Go] to cargo.toml')
          map('<leader>le', '<cmd>RustLsp explainError<CR>', '[E]xplain error')
          map('<leader>lp', '<cmd>RustLsp parentModule<CR>', '[P]arent Module')
          map('<leader>lr', '<cmd>RustLsp run<CR>', '[R]un')
          map('<leader>lR', '<cmd>RustLsp! run<CR>', '[R]erun latest run')
          map('<leader>lD', '<cmd>RustLsp relatedDiagnostics<CR>', 'Related [D]iagnostics')
          map('<leader>lc', '<cmd>RustLsp explainError<CR>', '[E]xplain error')
        end,
        settings = {
          -- rust-analyzer language server configuration
          ['rust-analyzer'] = {
            cargo = {
              allFeatures = true,
              loadOutDirsFromCheck = true,
              runBuildScripts = true,
            },
            checkOnSave = true,
            procMacro = {
              enable = true,
              ignored = {
                ['async-trait'] = { 'async_trait' },
                ['napi-derive'] = { 'napi' },
                ['async-recursion'] = { 'async_recursion' },
              },
            },
          },
        },
      },
      -- DAP configuration
      dap = {},
    }
  end,
}
