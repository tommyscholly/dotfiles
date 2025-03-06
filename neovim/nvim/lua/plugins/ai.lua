return {
   -- {
   --    "supermaven-inc/supermaven-nvim",
   --    config = function()
   --       require("supermaven-nvim").setup({})
   --    end,
   -- },
   {
      "github/copilot.vim",
      config = function()
         -- Disable Copilot for all filetypes, then enable it for Python.
         vim.g.copilot_filetypes = {
            java = false,
         }
      end
   },
   -- {
   --    "zbirenbaum/copilot.lua",
   --    config = function()
   --       -- Disable Copilot for all filetypes, then enable it for Python.
   --       vim.g.copilot_filetypes = {
   --          java = false,
   --       }
   --
   --       require("copilot").setup({
   --          suggestion = { enabled = true },
   --          panel = { enabled = false },
   --       })
   --    end,
   -- },
   -- {
   --    "zbirenbaum/copilot-cmp",
   --    config = function()
   --       require("copilot_cmp").setup()
   --    end
   -- },
}
