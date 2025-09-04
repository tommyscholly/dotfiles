return {
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local harpoon = require("harpoon")
            harpoon:setup({
                settings = {
                    key = function() return vim.loop.cwd() end
                }
            })

            vim.keymap.set("n", "<leader>sa", function() harpoon:list():add() end, { desc = "Harpoon [A]dd file" })
            vim.keymap.set("n", "<leader>su", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
                { desc = "Harpoon Quick Menu" })

            vim.keymap.set("n", "<leader>sl", function() harpoon:list():select(1) end, { desc = "Harpoon File 1" })
            vim.keymap.set("n", "<leader>sk", function() harpoon:list():select(2) end, { desc = "Harpoon File 2" })
            vim.keymap.set("n", "<leader>sj", function() harpoon:list():select(3) end, { desc = "Harpoon File 3" })
            vim.keymap.set("n", "<leader>sn", function() harpoon:list():select(4) end, { desc = "Harpoon File 4" })
            vim.keymap.set("n", "<leader>sm", function() harpoon:list():select(5) end, { desc = "Harpoon File 5" })
            vim.keymap.set("n", "<leader>si", function() harpoon:list():select(6) end, { desc = "Harpoon File 6" })

            -- Toggle previous & next buffers stored within Harpoon list
            vim.keymap.set("n", "<leader>s[", function() harpoon:list():prev() end, { desc = "Harpoon Previous Buffer" })
            vim.keymap.set("n", "<leader>s]", function() harpoon:list():next() end, { desc = "Harpoon Next Buffer" })
        end,
    }
}
