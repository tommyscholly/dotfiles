return {
   -- {
   --    "supermaven-inc/supermaven-nvim",
   --    config = function()
   --       require("supermaven-nvim").setup({})
   --    end,
   -- },
   -- {
   --    "github/copilot.vim",
   --    config = function()
   --       -- Disable Copilot for all filetypes, then enable it for Python.
   --       vim.g.copilot_filetypes = {
   --          java = false,
   --       }
   --    end
   -- },
   {
      'Exafunction/windsurf.vim',
      config = function()
         -- Change '<C-g>' here to any keycode you like.
         vim.keymap.set('i', '<C-y>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
         vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end,
            { expr = true, silent = true })
         vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end,
            { expr = true, silent = true })
         vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
      end
   }
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
