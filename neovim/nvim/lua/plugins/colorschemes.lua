return {
   {
      'AlessandroYorba/Alduin',
      priority = 1000,
      config = function()
         vim.cmd.colorscheme 'alduin'
      end,
   },
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
