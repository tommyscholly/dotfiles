local servers, _ = require("configs.servers")

return {
  {
    'neovim/nvim-lspconfig',
    cmd = 'LspInfo',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },

    },
    config = function()
      -- local lspconfig = require('lspconfig')
      -- local capabilities = require('cmp_nvim_lsp').default_capabilities()
      -- for server, config in pairs(servers) do
      --   config["capabilities"] = capabilities
      --   config["on_attach"] = function(client, _)
      --     client.server_capabilities.semanticTokensProvider = nil
      --   end
      --   lspconfig[server].setup(config)
      -- end

      -- vim.lsp.config['millet'].filetypes = { "sml", "sig", "fun", "grm" }
      local opts = { noremap = true, silent = true }
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    end
  },

  {
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended
    lazy = false,   -- This plugin is already lazy
  },
}
