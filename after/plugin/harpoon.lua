local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

-- Mark a file with harpoon
vim.keymap.set("n", "<leader>a", mark.add_file)

-- Toggle the quick menu
vim.keymap.set("n", "<C-f>", ui.toggle_quick_menu)

-- Hotkeys to switch between marked files
vim.keymap.set("n", "<C-p>", function()
	ui.nav_file(1)
end)
vim.keymap.set("n", "<C-[>", function()
	ui.nav_file(2)
end)
vim.keymap.set("n", "<C-]>", function()
	ui.nav_file(3)
end)
