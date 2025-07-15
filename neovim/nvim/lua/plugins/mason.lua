return {
    {
        "mason-org/mason.nvim",
        config = function()
            require("mason").setup {}
        end,
    },
    {
        "mason-org/mason-lspconfig.nvim",
        config = function()
            local servers, _ = require("configs.servers")
            local servers_arr = {}

            for server, _ in pairs(servers) do
                table.insert(servers_arr, server)
            end

            local mason_lspconfig = require("mason-lspconfig")
            mason_lspconfig.setup {}
        end,
    }
}
