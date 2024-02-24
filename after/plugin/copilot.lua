-- Create an autocommand group for GitHub Copilot
vim.api.nvim_create_augroup("CopilotGroup", { clear = true })

-- Add an autocommand to the group
vim.api.nvim_create_autocmd("BufEnter", {
	group = "CopilotGroup",
	pattern = "*",
	callback = function()
		-- Enable GitHub Copilot for the buffer
		vim.cmd("Copilot enable")
	end,
})

-- Map 'leader cpd' to disable Copilot
vim.api.nvim_set_keymap("n", "<leader>cpd", ":Copilot disable<CR>", { noremap = true, silent = true })
