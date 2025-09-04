return {
   {
      'AlessandroYorba/Alduin',
      priority = 1000,
      config = function()
         vim.cmd.colorscheme 'alduin'
      end,

   },
   -- {
   --    'everviolet/nvim',
   --    name = 'evergarden',
   --    priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
   --    opts = {
   --       theme = {
   --          variant = 'winter', -- 'winter'|'fall'|'spring'|'summer'
   --          accent = 'green',
   --       },
   --       editor = {
   --          transparent_background = false,
   --          sign = { color = 'none' },
   --          float = {
   --             color = 'mantle',
   --             solid_border = false,
   --          },
   --          completion = {
   --             color = 'surface0',
   --          },
   --       },
   --    },
   --    config = function()
   --       vim.cmd.colorscheme 'evergarden'
   --    end,
   -- }
   -- {
   --    "zenbones-theme/zenbones.nvim",
   --    dependencies = "rktjmp/lush.nvim",
   --    priority = 1000,
   --    config = function()
   --       vim.o.background = "light"
   --       vim.g.zenbones_darken_comments = 45
   --       vim.cmd.colorscheme('zenbones')
   --    end
   -- }
}
