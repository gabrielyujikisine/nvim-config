return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvimtools/none-ls-extras.nvim",
    },
    config = function()
        local null_ls = require("null-ls")

        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

        null_ls.setup({
            -- Sources for null_ls
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.clang_format,
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.prettierd,
                null_ls.builtins.formatting.cmake_format,
                null_ls.builtins.diagnostics.cmake_lint,
                null_ls.builtins.diagnostics.proselint,
            },
            -- Auto format files on save
            on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format({ async = false })
                        end,
                    })
                end
            end,
        })

        vim.lsp.buf.format({ timeout_ms = 600000 })
        vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "Format file" })
    end,
}
