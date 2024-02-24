local lsp_zero = require("lsp-zero")
local lspconfig = require("lspconfig")

-- Step 2: Add folding range capabilities and configure global server settings
lsp_zero.set_server_config({
	capabilities = vim.lsp.protocol.make_client_capabilities(),
})

lsp_zero.get_capabilities().textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

-- Configure your LSP servers as usual
require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = { "tsserver", "eslint", "lua_ls", "marksman", "rust_analyzer" },
	handlers = {
		lsp_zero.default_setup,
	},
})

-- This setup removes the "undefined global vim" warning in our settings.lua
lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

-- Step 3: Setup nvim-ufo
require("ufo").setup()

lsp_zero.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, opts)
	vim.keymap.set("n", "<leader>vws", function()
		vim.lsp.buf.workspace_symbol()
	end, opts)
	vim.keymap.set("n", "<leader>vd", function()
		vim.diagnostic.open_float()
	end, opts)
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.goto_next()
	end, opts)
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.goto_prev()
	end, opts)
	vim.keymap.set("n", "<leader>vca", function()
		vim.lsp.buf.code_action()
	end, opts)
	vim.keymap.set("n", "<leader>vrr", function()
		vim.lsp.buf.references()
	end, opts)
	vim.keymap.set("n", "<leader>vrn", function()
		vim.lsp.buf.rename()
	end, opts)
	vim.keymap.set("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, opts)
end)
