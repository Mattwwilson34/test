require("nvim-tree").setup({
	sort_by = "case_sensitive",
	view = {
		width = 40,
	},
	renderer = {
		group_empty = false,
		indent_markers = {
			enable = true,
		},
		icons = {
			glyphs = {
				folder = {
					arrow_closed = "", -- arrow when folder is closed
					arrow_open = "", -- arrow when folder is open
				},
			},
		},
	},
	filters = {
		dotfiles = false,
	},
	git = {
		ignore = false,
	},
	update_focused_file = {
		enable = true,
	},
})

vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { silent = true, noremap = true })
