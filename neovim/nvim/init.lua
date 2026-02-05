vim.cmd([[set noswapfile]])

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

vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0

vim.defer_fn(function()
    if vim.fn.has('clipboard') == 1 then
        vim.opt.clipboard = 'unnamedplus'
    end
end, 100)

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

    { src = "https://github.com/windwp/nvim-autopairs" },

    -- git nicities
    { src = "https://github.com/tpope/vim-fugitive" },
    { src = "https://github.com/lewis6991/gitsigns.nvim" },
    { src = "https://github.com/nvim-lualine/lualine.nvim" },

    -- detect tab stop
    { src = "https://github.com/tpope/vim-sleuth" },

    -- switch between file pairs
    { src = "https://github.com/rgroli/other.nvim" },

    { src = "https://github.com/supermaven-inc/supermaven-nvim" },

    { src = "https://codeberg.org/andyg/leap.nvim" },
    -- leap dependency
    { src = "https://github.com/tpope/vim-repeat" },
    { src = "https://github.com/lopi-py/luau-lsp.nvim" },

    { src = "https://github.com/sindrets/diffview.nvim" },

    -- { src = "https://github.com/ThePrimeagen/99" },
}

vim.pack.add(packages)

vim.api.nvim_create_user_command("PackCleanup", function()
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
end, { desc = "Clear unused packages" })



vim.cmd.colorscheme("alduin")

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.wo.foldlevel = 99

vim.defer_fn(function()
    require("lualine").setup({
        options = { icons_enabled = false, theme = 'auto', component_separators = '|', section_separators = '' },
        sections = {
            lualine_c = { function()
                local f = vim.fn.expand('%:p')
                return vim.fn.fnamemodify(f, ':h:h:t') ..
                    '/' .. vim.fn.fnamemodify(f, ':h:t') .. '/' .. vim.fn.expand('%:t')
            end }
        }
    })
    require("nvim-autopairs").setup()
    require("gitsigns").setup({
        signs = { add = { text = '+' }, change = { text = '~' }, delete = { text = '_' } }
    })

    require("supermaven-nvim").setup({})
end, 50)


vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

local map = vim.keymap.set
map('n', '<leader>o', ':update<CR> :source<CR>')
map('n', '<leader>pu', function() vim.pack.update() end, { desc = 'Update Plugins' })

map('n', '<leader>gd', ':DiffviewOpen<CR>', { desc = '[G]it [D]iff' })
map('n', '<leader>gc', ':DiffviewClose<CR>', { desc = '[G]it Diffview [C]lose' })

map('n', '<leader>gf', function() require("telescope.builtin").git_files() end, { desc = 'Search [G]it [F]iles' })
map('n', '<leader>ff', function() require("telescope.builtin").find_files() end, { desc = '[F]ind [F]iles' })
map('n', '<leader>fh', function() require("telescope.builtin").help_tags() end, { desc = '[F]ind [H]elp' })
map('n', '<leader>fw', function() require("telescope.builtin").grep_string() end, { desc = '[F]ind current [W]ord' })
map('n', '<leader>fg', function() require("telescope.builtin").live_grep() end, { desc = '[F]ind by [G]rep' })
map('n', '<leader>fd', function() require("telescope.builtin").diagnostics() end, { desc = '[F]ind [D]iagnostics' })
map('n', '<leader>fr', function() require("telescope.builtin").resume() end, { desc = '[F]ind [R]esume' })
map('n', '<leader>fi', function() require("telescope.builtin").lsp_implementations() end,
    { desc = "[F]ind [I]mplementations" })
map('n', '<leader>fb', function() require("telescope.builtin").builtin() end, { desc = "[F]ind [B]uiltin" })
map('n', '<leader>ft', function() require("telescope.builtin").lsp_type_definitions() end,
    { desc = "[F]ind [T]ype Definitions" })

-- map('n', '<leader>ao', ':SupermavenStart<CR>')
-- map('n', '<leader>ap', ':SupermavenStop<CR>')

map('n', '<leader>lt', function() vim.diagnostic.config({ virtual_text = true, virtual_lines = false }) end)
map('n', '<leader>ly', function() vim.diagnostic.config({ virtual_text = false, virtual_lines = true }) end)
map('n', '<leader>li', ':checkhealth vim.lsp<CR>', { silent = true })

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

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(_)
        vim.lsp.inlay_hint.enable(true)
    end,
})

map('n', '<leader>i', function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end,
    { desc = "Toggle inlay hints" })

map('n', '<leader>lf', vim.lsp.buf.format)

local opts = { noremap = true, silent = true }
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
-- vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "rust", "lua", "python", "cpp", "c", "typst" },
    once = true,
    callback = function()
        require("mason").setup()

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

        -- Enable LSPs
        local lsp = vim.lsp
        lsp.enable({ "lua_ls", "clangd", "basedpyright", "rust_analyzer" })

        require("luau-lsp").setup({})

        -- Config specific LSPs
        lsp.config('rust_analyzer', {
            cmd = { 'rust-analyzer' },
            settings = { ['rust-analyzer'] = { checkOnSave = true, check = { command = "clippy" } } }
        })
    end
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

map('n', ']c', function() require('gitsigns').next_hunk() end, { desc = 'Next Git Sign', silent = true })
map('n', '[c', function() require('gitsigns').prev_hunk() end, { desc = 'Previous Git Sign', silent = true })
map('n', '<leader>hs', function() require('gitsigns').stage_hunk() end)
map('n', '<leader>hr', function() require('gitsigns').reset_hunk() end)
map('v', '<leader>hs', function()
    require('gitsigns').stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
end)
map('v', '<leader>hr', function()
    require('gitsigns').reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
end)

map("n", "<leader>ll", function()
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
            -- C/C++ files (same directory)
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
                    { target = "%1.c",   context = "source" },
                    { target = "%1.cpp", context = "source" },
                    { target = "%1.cc",  context = "source" },
                },
            },
            -- C/C++ files (src/ <-> include/Luau/)
            {
                pattern = "(.*)/src/(.*).cpp$",
                target = "%1/include/Luau/%2.h",
            },
            {
                pattern = "(.*)/src/(.*).c$",
                target = "%1/include/Luau/%2.h",
            },
            {
                pattern = "(.*)/src/(.*).cc$",
                target = "%1/include/Luau/%2.h",
            },
            {
                pattern = "(.*)/include/Luau/(.*).h$",
                target = {
                    { target = "%1/src/%2.c",   context = "source" },
                    { target = "%1/src/%2.cpp", context = "source" },
                    { target = "%1/src/%2.cc",  context = "source" },
                },
            },
        },
    })
end, { noremap = true, silent = true })

vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap)')
vim.keymap.set('n', 'S', '<Plug>(leap-from-window)')

-- require("llms.99")()
