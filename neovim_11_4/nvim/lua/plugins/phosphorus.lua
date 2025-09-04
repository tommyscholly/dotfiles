return {
   dir = "~/Documents/dev/lua/phosphorus", -- Your path
   name = "phosphorus",
   dependencies = { "nvim-lua/plenary.nvim", "folke/snacks.nvim", "MunifTanjim/nui.nvim" },
   config = function()
      require("phosphorus").setup({ base_dir = "/home/tom/workspace" })

      vim.keymap.set("n", "<leader>ps", "<cmd>PhosShow<CR>", { desc = "phosphorus show", noremap = true, silent = true })
      vim.keymap.set("n", "<leader>par", "<cmd>PhosAddRepo<CR>",
         { desc = "phosphorus add repo", noremap = true, silent = true })
      vim.keymap.set("n", "<leader>pab", "<cmd>PhosAddBranch<CR>",
         { desc = "phosphorus add repo", noremap = true, silent = true })
      vim.keymap.set("n", "<leader>pdr", "<cmd>PhosDeleteRepo<CR>",
         { desc = "phosphorus delete repo", noremap = true, silent = true })
      vim.keymap.set("n", "<leader>pdb", "<cmd>PhosDeleteBranch<CR>",
         { desc = "phosphorus delete branch", noremap = true, silent = true })
   end
}
