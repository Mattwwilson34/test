local builtin = require("telescope.builtin")

-- Find all files
vim.keymap.set("n", "<leader>pf", builtin.find_files, {})

-- Find all files include dot files
vim.keymap.set("n", "<leader>ph", function()
	builtin.find_files({ hidden = true })
end, {})

-- Find git files
vim.keymap.set("n", "<leader>pg", builtin.git_files, {})

-- Grep
vim.keymap.set("n", "<leader>ps", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
