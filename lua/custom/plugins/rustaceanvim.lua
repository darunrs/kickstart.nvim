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
          map('go', '<cmd>RustLsp openCargo<CR>', 'Go to cargo.toml')
          map('<leader>le', '<cmd>RustLsp explainError<CR>', 'Explain error')
          map('<leader>lr', '<cmd>RustLsp run<CR>', 'Run')
          map('<leader>lR', '<cmd>RustLsp! run<CR>', 'Rerun latest run')
        end,
        settings = {
          -- rust-analyzer language server configuration
          ['rust-analyzer'] = {
            cargo = {
              allFeatures = true,
              loadOutDirsFromCheck = true,
              runBuildScripts = true,
            },
            checkOnSave = { -- Add clippy lints for Rust.
              allFeatures = true,
              command = 'clippy',
              extraArgs = { '--no-deps' },
            },
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
