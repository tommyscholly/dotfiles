return {
    {
        -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        setup = {
            ident = { enable = true },
        },
        build = ':TSUpdate',
    },
}
