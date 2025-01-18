return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup {}
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            local servers, _ = require("configs.servers")
            local servers_arr = {}

            for server, _ in pairs(servers) do
                table.insert(servers_arr, server)
            end

            local mason_lspconfig = require("mason-lspconfig")
            mason_lspconfig.setup {
                ensure_installed = servers_arr
            }

            mason_lspconfig.setup_handlers {
                luau_lsp = function()
                    require("luau-lsp").setup {
                        sourcemap = {
                            enable = true, -- enable sourcemap generation
                            autogenerate = true,
                        },
                        types = {
                            roblox = true, -- enable roblox api
                        },
                    }
                end
            }
        end,
    }
}
