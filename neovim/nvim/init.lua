-- vim.cmd([[set mouse=]])
vim.cmd([[set noswapfile]])

-- require("lua.schemes.colorscheme").setup()

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.wrap = false
vim.opt.hlsearch = false
vim.opt.textwidth = 0
vim.opt.wrapmargin = 0
vim.opt.formatoptions = ""
-- vim.opt.cursorcolumn = false
vim.opt.ignorecase = false
vim.opt.smartindent = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.signcolumn = "yes"

vim.opt.clipboard = 'unnamedplus'

local packages = {
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

    -- { src = "https://github.com/mrcjkb/rustaceanvim",             version = "v6.9.2" },

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

    { src = "https://github.com/supermaven-inc/supermaven-nvim" },

    -- better sml dependency
    -- { src = "https://github.com/dense-analysis/ale" }

    { src = "https://github.com/ggandor/leap.nvim" },
    -- leap dependency
    { src = "https://github.com/tpope/vim-repeat" },
    { src = "https://github.com/lopi-py/luau-lsp.nvim" }
}

vim.pack.add(packages)

local installed = vim.pack.get()

local to_remove = {}
for _, package in ipairs(installed) do
    -- check if the package is in the list of packages
    -- if not, then remove it
    local should_remove = true
    for _, p in ipairs(packages) do
        if package.spec.src == p.src then
            should_remove = false
        end
    end

    if should_remove then
        table.insert(to_remove, package.spec.name)
    end
end

if #to_remove > 0 then
    vim.pack.del(to_remove)
    print("Removed packages: ")
    vim.print(to_remove)
end


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

vim.filetype.add({
    extension = {
        sml = "sml",
        fun = "sml",
        sig = "sml",
    }
})
vim.api.nvim_create_autocmd('User', {
    pattern = 'TSUpdate',
    callback = function()
        require('nvim-treesitter.parsers').zimbu = {
            install_info = {
                path = '/home/tom/Documents/dev/tree-sitter-sml',
                -- optional entries
                location = 'parser',
                generate = false,
                generate_from_json = false,
                -- queries = 'queries/neovim',         -- symlink queries from given directory
            },
        }
    end
})

require('nvim-treesitter').install({ 'rust', 'lua', 'ocaml', 'c', 'cpp', 'python', 'sml' })

vim.treesitter.language.register('sml', { 'sml', 'sig', 'fun' })
require("supermaven-nvim").setup({})

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

local map = vim.keymap.set
map('n', '<leader>o', ':update<CR> :source<CR>')
map('n', '<leader>pu', function() vim.pack.update() end, { desc = 'Update Plugins' })

local builtin = require("telescope.builtin")
map('n', '<leader>gf', builtin.git_files, { desc = 'Search [G]it [F]iles' })
map('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
map('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
map('n', '<leader>fw', builtin.grep_string, { desc = '[F]ind current [W]ord' })
map('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind by [G]rep' })
map('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind [D]iagnostics' })
map('n', '<leader>fr', builtin.resume, { desc = '[F]ind [R]esume' })
map('n', '<leader>fi', builtin.lsp_implementations, { desc = "[F]ind [I]mplementations" })
map('n', '<leader>fb', builtin.builtin, { desc = "[F]ind [B]uiltin" })
map('n', '<leader>ft', builtin.lsp_type_definitions, { desc = "[F]ind [T]ype Definitions" })

map('n', '<leader>ao', ':SupermavenStart<CR>')
map('n', '<leader>ap', ':SupermavenStop<CR>')

map('n', '<leader>lt', function() vim.diagnostic.config({ virtual_text = true, virtual_lines = false }) end)
map('n', '<leader>ly', function() vim.diagnostic.config({ virtual_text = false, virtual_lines = true }) end)
map('n', '<leader>li', ':checkhealth vim.lsp<CR>', { silent = true })

-- local virt_lines_ns = vim.api.nvim_create_namespace 'on_diagnostic_jump'
--
-- local function on_jump(diagnostic, bufnr)
--     if not diagnostic then return end
--
--     vim.diagnostic.show(
--         virt_lines_ns,
--         bufnr,
--         { diagnostic },
--         { virtual_lines = { current_line = true }, virtual_text = false }
--     )
-- end

-- Create a custom namespace. This will aggregate signs from all other
-- namespaces and only show the one with the highest severity on a
-- given line
local ns = vim.api.nvim_create_namespace("my_namespace")
-- Get a reference to the original signs handler
local orig_signs_handler = vim.diagnostic.handlers.signs
-- Override the built-in signs handler
vim.diagnostic.handlers.signs = {
    show = function(_, bufnr, _, opts)
        -- Get all diagnostics from the whole buffer rather than just the
        -- diagnostics passed to the handler
        local diagnostics = vim.diagnostic.get(bufnr)
        -- Find the "worst" diagnostic per line
        local max_severity_per_line = {}
        for _, d in pairs(diagnostics) do
            local m = max_severity_per_line[d.lnum]
            if not m or d.severity < m.severity then
                max_severity_per_line[d.lnum] = d
            end
        end
        -- Pass the filtered diagnostics (with our custom namespace) to
        -- the original handler
        local filtered_diagnostics = vim.tbl_values(max_severity_per_line)
        orig_signs_handler.show(ns, bufnr, filtered_diagnostics, opts)
    end,
    hide = function(_, bufnr)
        orig_signs_handler.hide(ns, bufnr)
    end,
}

vim.diagnostic.config({
    virtual_lines = true,
    -- virtual_text = true,
    -- { jump = { on_jump = on_jump } }
})

vim.lsp.inlay_hint.enable(true)
map('n', '<leader>i', function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end,
    { desc = "Toggle inlay hints" })

map('n', '<leader>lf', vim.lsp.buf.format)

local opts = { noremap = true, silent = true }
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
-- vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

vim.lsp.enable({
    "lua_ls",
    "tinymist",
    "clangd",
    "basedpyright",
    "rust_analyzer",
})

vim.lsp.config('rust_analyzer', {
    cmd = { 'rust-analyzer' },
    filetypes = { 'rust' },
    root_markers = { 'Cargo.toml', 'rust-project.json' },
    settings = {
        ['rust-analyzer'] = {
            cargo = {
                allFeatures = true,
            },
            checkOnSave = true,
            diagnostics = {
                disabled = { "inactive-code" }
            },
        },
    },
})

require("luau-lsp").setup {
    -- platform = {
    --     type = "roblox",
    -- },
    -- sourcemap = {
    --     enabled = true,
    --     autogenerate = true, -- automatic generation when the server is initialized
    --     rojo_project_file = "default.project.json",
    --     sourcemap_file = "sourcemap.json",
    -- },
}

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


local gs = require('gitsigns')
map('n', ']c', function() gs.next_hunk() end, { desc = 'Next Git Sign', silent = true })
map('n', '[c', function() gs.prev_hunk() end, { desc = 'Previous Git Sign', silent = true })
map('n', '<leader>hs', gs.stage_hunk)
map('n', '<leader>hr', gs.reset_hunk)
map('v', '<leader>hs', function()
    gs.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
end)
map('v', '<leader>hr', function()
    gs.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
end)



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
        },
        -- C/C++ files
        {
            pattern = "(.*).c$",
            target = "%1.h",
        },
        {
            pattern = "(.*).cpp$",
            target = "%1.h",
        },
        {
            pattern = "(.*).cc$",
            target = "%1.h",
        },
        {
            pattern = "(.*).h$",
            target = {
                {
                    target = "%1.c",
                    context = "source"
                },
                {
                    target = "%1.cpp",
                    context = "source"
                },
                {
                    target = "%1.cc",
                    context = "source"
                }
            }
        }
    },
})
map("n", "<leader>ll", "<cmd>:Other<CR>", { noremap = true, silent = true })

vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap)')
vim.keymap.set('n', 'S', '<Plug>(leap-from-window)')
