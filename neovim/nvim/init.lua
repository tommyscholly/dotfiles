-- vim.cmd([[set mouse=]])
vim.cmd([[set noswapfile]])

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.expandtab = true
vim.opt.wrap = false
vim.opt.hlsearch = false
vim.opt.textwidth = 0
vim.opt.wrapmargin = 0
vim.opt.formatoptions = ""
-- vim.opt.cursorcolumn = false
vim.opt.ignorecase = true
vim.opt.smartindent = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.signcolumn = "yes"

vim.opt.clipboard = 'unnamedplus'

vim.pack.add({
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
    { src = "https://github.com/AlessandroYorba/Alduin" },

    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/nvim-tree/nvim-web-devicons" },
    { src = "https://github.com/nvim-telescope/telescope.nvim" },

    { src = "https://github.com/ThePrimeagen/harpoon",            version = "harpoon2" },

    { src = 'https://github.com/neovim/nvim-lspconfig' },
    { src = "https://github.com/mason-org/mason.nvim" },

    { src = 'https://github.com/hrsh7th/nvim-cmp' },
    -- Snippet Engine & its associated nvim-cmp source
    { src = 'https://github.com/L3MON4D3/LuaSnip' },
    { src = 'https://github.com/saadparwaiz1/cmp_luasnip' },

    -- Adds LSP completion capabilities
    { src = 'https://github.com/hrsh7th/cmp-nvim-lsp' },

    { src = "https://github.com/mrcjkb/rustaceanvim",             version = "v6.9.2" },

    { src = "https://github.com/windwp/nvim-autopairs" },

    -- git nicities
    { src = "https://github.com/tpope/vim-fugitive" },
    { src = "https://github.com/lewis6991/gitsigns.nvim" },
    { src = "https://github.com/nvim-lualine/lualine.nvim" },

    -- detect tab stop
    { src = "https://github.com/tpope/vim-sleuth" },

    -- works with tinymist
    { src = "https://github.com/chomosuke/typst-preview.nvim" },

    -- switch between file pairs
    { src = "https://github.com/rgroli/other.nvim" },

    { src = "https://github.com/jez/vim-better-sml" }
})

vim.cmd.colorscheme("alduin")

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.wo.foldlevel = 99

require("mason").setup()
require("lualine").setup({
    options = {
        icons_enabled = false,
        theme = 'auto',
        component_separators = '|',
        section_separators = '',
    },
})
require("telescope").setup()
require('nvim-treesitter').install( { 'rust', 'lua', 'ocaml', 'c', 'cpp', 'python' })

vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

require("nvim-autopairs").setup()
require("gitsigns").setup({
    signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
    },
})
require("rustaceanvim")

local map = vim.keymap.set
map('n', '<leader>o', ':update<CR> :source<CR>')
map('n', '<leader>pu', function() vim.pack.update() end, { desc = 'Update Plugins' })

map('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
map('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[F]ind [F]iles' })
map('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = '[F]ind [H]elp' })
map('n', '<leader>fw', require('telescope.builtin').grep_string, { desc = '[F]ind current [W]ord' })
map('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = '[F]ind by [G]rep' })
map('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = '[F]ind [D]iagnostics' })
map('n', '<leader>fr', require('telescope.builtin').resume, { desc = '[F]ind [R]esume' })

-- LSP info

vim.diagnostic.config({
    -- virtual_lines = true,
    virtual_text = true,
})

map('n', '<leader>i', function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end,
    { desc = "Toggle inlay hints" })

map('n', '<leader>lf', vim.lsp.buf.format)
-- vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

vim.lsp.enable({
    "lua_ls",
    "tinymist",
    "clangd",
    -- "rust_analyzer",
    "pylsp",
})

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.hl.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})


local harpoon = require("harpoon")
harpoon.setup()

map("n", "<leader>su", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
    { desc = "Harpoon Quick Menu" })

map("n", "<leader>sa", function() harpoon:list():add() end, { desc = "Harpoon [A]dd file" })
map("n", "<leader>su", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
    { desc = "Harpoon Quick Menu" })

map("n", "<leader>sl", function() harpoon:list():select(1) end, { desc = "Harpoon File 1" })
map("n", "<leader>sk", function() harpoon:list():select(2) end, { desc = "Harpoon File 2" })
map("n", "<leader>sj", function() harpoon:list():select(3) end, { desc = "Harpoon File 3" })
map("n", "<leader>sn", function() harpoon:list():select(4) end, { desc = "Harpoon File 4" })
map("n", "<leader>sm", function() harpoon:list():select(5) end, { desc = "Harpoon File 5" })
map("n", "<leader>si", function() harpoon:list():select(6) end, { desc = "Harpoon File 6" })

-- Toggle previous & next buffers stored within Harpoon list
map("n", "<leader>s[", function() harpoon:list():prev() end, { desc = "Harpoon Previous Buffer" })
map("n", "<leader>s]", function() harpoon:list():next() end, { desc = "Harpoon Next Buffer" })

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = cmp.mapping.preset.insert({
    ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-l>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil
cmp.setup {
    mapping = cmp_mappings,
    snippet = {
        expand = function(args)
            require 'luasnip'.lsp_expand(args.body)
        end
    },

    sources = {
        { name = 'nvim_lsp' },
    },
}


-- vim.filetype.add({
--     extension = {
--         -- treesitter doesnt have a SML parser, just an ocaml one
--         -- the SML filetype breaks identation for some reason that I cannot figure out
--         sml = "ocaml",
--         fun = "ocaml",
--         sig = "ocaml",
--         grm = "ocaml"
--     }
-- })

vim.api.nvim_create_autocmd("FileType", {
    pattern = "sml",
    callback = function()
        vim.bo.commentstring = "(* %s *)"
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "grm",
    callback = function()
        vim.bo.commentstring = "(* %s *)"
    end,
})

require("other-nvim").setup({
    mappings = {
        -- sml
        {
            pattern = "(.*).fun$",
            target = "%1.sig",
        },
        {
            pattern = "(.*).sig$",
            target = "%1.fun",
        }
    },
})
map("n", "<leader>ll", "<cmd>:Other<CR>", { noremap = true, silent = true })
