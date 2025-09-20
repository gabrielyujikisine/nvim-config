return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
    },

    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
            },
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup({
                        capabilities = capabilities,
                    })
                end,

                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup({
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                format = {
                                    enable = true,
                                    defaultConfig = {
                                        indent_style = "space",
                                        indent_size = "2",
                                    },
                                },
                            },
                        },
                    })
                end,
                ["harper-ls"] = {
                    userDictPath = "",
                    fileDictPath = "",
                    linters = {
                        AnotherThinkComing = true,
                        SpellCheck = true,
                        UseGenitive = true,
                        BoringWords = true,
                        SpelledNumbers = true,
                        AnA = true,
                        SentenceCapitalization = true,
                        UnclosedQuotes = true,
                        WrongQuotes = false,
                        LongSentences = true,
                        RepeatedWords = true,
                        Spaces = true,
                        Matcher = true,
                        CorrectNumberSuffix = true,
                    },
                    codeActions = {
                        ForceStable = false,
                    },
                    markdown = {
                        IgnoreLinkTitle = false,
                    },
                    diagnosticSeverity = "hint",
                    isolateEnglish = false,
                    dialect = "American",
                    maxFileLength = 120000,
                },
            },
        })
        vim.keymap.set("n", "<leader>ch", vim.lsp.buf.hover, { desc = "Lsp hover" })
        vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, { desc = "Lsp definition" })
        vim.keymap.set("n", "<leader>cr", vim.lsp.buf.references, { desc = "Lsp reference" })
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Lsp code action" })
    end,
}
