return {
   "yetone/avante.nvim",
   build = function()
      -- conditionally use the correct build system for the current OS
      if vim.fn.has("win32") == 1 then
         return "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
      else
         return "make"
      end
   end,
   event = "VeryLazy",
   version = false,
   opts = {
      provider = "copilot",
      behaviour = {
         enable_token_counting = false,
      },
      mappings = {
         ask = "<leader>ua",
         edit = "<leader>ue",
         refresh = "<leader>ur",
      },
   },
   keys = function(_, keys)
      ---@type avante.Config
      local opts =
          require("lazy.core.plugin").values(require("lazy.core.config").spec.plugins["avante.nvim"], "opts", false)

      local mappings = {
         {
            opts.mappings.ask,
            function() require("avante.api").ask() end,
            desc = "avante: ask",
            mode = { "n", "v" },
         },
         {
            opts.mappings.refresh,
            function() require("avante.api").refresh() end,
            desc = "avante: refresh",
            mode = "v",
         },
         {
            opts.mappings.edit,
            function() require("avante.api").edit() end,
            desc = "avante: edit",
            mode = { "n", "v" },
         },
      }
      mappings = vim.tbl_filter(function(m) return m[1] and #m[1] > 0 end, mappings)
      return vim.list_extend(mappings, keys)
   end,
   dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "echasnovski/mini.pick",         -- for file_selector provider mini.pick
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "hrsh7th/nvim-cmp",              -- autocompletion for avante commands and mentions
      "ibhagwan/fzf-lua",              -- for file_selector provider fzf
      "stevearc/dressing.nvim",        -- for input provider dressing
      "folke/snacks.nvim",             -- for input provider snacks
      "nvim-tree/nvim-web-devicons",   -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua",        -- for providers='copilot'
      {
         -- support for image pasting
         "HakonHarnes/img-clip.nvim",
         event = "VeryLazy",
         opts = {
            -- recommended settings
            default = {
               embed_image_as_base64 = false,
               prompt_for_file_name = false,
               drag_and_drop = {
                  insert_mode = true,
               },
               -- required for Windows users
               use_absolute_path = true,
            },
         },
      },
      {
         -- Make sure to set this up properly if you have lazy=true
         'MeanderingProgrammer/render-markdown.nvim',
         opts = {
            file_types = { "markdown", "Avante" },
         },
         ft = { "markdown", "Avante" },
      },
   },
}
