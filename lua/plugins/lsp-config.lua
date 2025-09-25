return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
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
			})
			vim.keymap.set("n", "<leader>ch", vim.lsp.buf.hover, { desc = "Lsp hover" })
			vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, { desc = "Lsp definition" })
			vim.keymap.set("n", "<leader>cr", vim.lsp.buf.references, { desc = "Lsp reference" })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Lsp code action" })
		end,
	},
}
