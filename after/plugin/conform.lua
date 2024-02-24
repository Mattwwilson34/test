local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		javascript = { "prettier" },
		typescript = { "prettier" },
		javascriptreact = { "prettier" },
		typescriptreact = { "prettier" },
		css = { "prettier" },
		html = { "prettier" },
		json = { "prettier" },
		yaml = { "prettier" },
		markdown = { "prettier" },
		graphql = { "prettier" },
		lua = { "stylua" },
		python = { "black", "isort" },
		bash = { "beautysh" },
	},
	format_on_save = {
		lsp_fallback = false,
		async = false,
		timeout_ms = 1000,
	},
})

-- Black and Isort args are pulled from product repo inside .vscode/settings.json
-- They are added to keep my formatting inline with Radials
conform.formatters.black = {
	prepend_args = { "-l", "119", "--target-version", "py311", "--skip-magic-trailing-comma" },
}

conform.formatters.isort = {
	prepend_args = { "-m3", "--trailing-comma", "-l", "119" },
}

vim.keymap.set({ "n", "v" }, "<leader>mp", function()
	conform.format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	})
	print("file formatted")
end, { desc = "Format file or range (in visual mode)" })
