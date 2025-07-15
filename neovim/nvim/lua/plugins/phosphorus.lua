return {
   dir = "~/Documents/dev/lua/phosphorus", -- Your path
   name = "phosphorus",
   dependencies = { "nvim-lua/plenary.nvim", "folke/snacks.nvim", "MunifTanjim/nui.nvim" },
   config = function()
      require("phosphorus").setup({ base_dir = "/home/tom/workspace" })

      vim.keymap.set("n", "<leader>ps", ":PhosShow<CR>", { desc = "phosphorus show" })
      vim.keymap.set("n", "<leader>pa", ":PhosAddRepo<CR>", { desc = "phosphorus add repo" })
   end
}
