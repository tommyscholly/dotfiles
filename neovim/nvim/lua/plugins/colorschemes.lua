return {
   {
      'AlessandroYorba/Alduin',
      priority = 1000,
      config = function()
         vim.cmd.colorscheme 'alduin'
      end,
   },
   {
      "ellisonleao/gruvbox.nvim",
      priority = 1000,
      config = function()
         vim.o.background = "light"
         -- vim.g.gruvbox_contrast_dark = "hard"
         -- vim.cmd.colorscheme "gruvbox"
      end
   },
   {
      "savq/melange-nvim",
      config = function()
         -- vim.o.background = "light"
         -- vim.cmd.colorscheme "melange"
      end
   },
   {
      "sho-87/kanagawa-paper.nvim",
      lazy = false,
      priority = 1000,
      opts = {
      },

      config = function()
         require("kanagawa-paper").setup({
            gutter = false,
            overrides = function(colors)
               return {
                  string = { fg = colors.palette.carpYellow, italic = false },
                  parameter = { fg = colors.palette.dragonRed }
               }
            end
         })
         -- vim.cmd.colorscheme 'kanagawa-paper'
      end,
   },
   {
      "slugbyte/lackluster.nvim",
      lazy = false,
      priority = 1000,
      config = function()
         local lackluster = require("lackluster")
         local color = lackluster.color

         lackluster.setup({
            tweak_syntax = {
               comment = color.gray6
            }
         })
      end,
      init = function()
         -- vim.cmd.colorscheme("lackluster")
         -- vim.cmd.colorscheme("lackluster-hack")
         -- vim.cmd.colorscheme("lackluster-mint")
         -- vim.cmd.colorscheme("lackluster-night")
      end,
   }
}
