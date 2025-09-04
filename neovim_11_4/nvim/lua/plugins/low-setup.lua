-- For plugins with low or minimal setup
-- If it has a config function, probably doesn't go here

return {
    -- Git related plugins
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',

    'tpope/vim-surround',

    "ckipp01/stylua-nvim",
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {},
    },

    -- Detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',

    { 'folke/which-key.nvim',  opts = {}, dependencies = { "echasnovski/mini.icons" } },

    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },

    {
        -- Add indentation guides even on blank lines
        'lukas-reineke/indent-blankline.nvim',
        -- Enable `lukas-reineke/indent-blankline.nvim`
        -- See `:help ibl`
        main = 'ibl',
        opts = {},
    },

    -- "gc" to comment visual regions/lines
    { 'numToStr/Comment.nvim', opts = {}, lazy = false },


    {
        "kawre/leetcode.nvim",
        build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
        dependencies = {
            "nvim-telescope/telescope.nvim",
            -- "ibhagwan/fzf-lua",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
        },
        opts = {
            lang = "rust",
        },
    },

    'mfussenegger/nvim-dap',

    {
        "chentoast/marks.nvim",
        event = "VeryLazy",
        opts = {
            -- mappings = {
            -- next = "]m",
            -- prev = "[m",
            -- }
        },
    },

    {
        'mbbill/undotree',
        config = function()
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
        end
    },

    {
        "lopi-py/luau-lsp.nvim",
        opts = {
            platform = {
                type = "roblox",
            },
            sourcemap = {
                enabled = true,
                autogenerate = true,
                rojo_project_file = "default.project.json",
                sourcemap_file = "sourcemap.json",
            },
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    }

}
