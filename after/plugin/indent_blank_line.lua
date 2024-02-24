require("ibl").setup({
	debounce = 100,
	indent = { highlight = "CustomIndentGuides" },
	whitespace = { highlight = { "Whitespace", "NonText" } },
	scope = {
		enabled = true,
		show_start = true,
		show_end = false,
		injected_languages = false,
		highlight = { "Function", "Label" },
		priority = 500,
	},
})
