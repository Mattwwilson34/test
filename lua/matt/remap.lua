-- Map space to leader
vim.g.mapleader = " "

-- NetRW (don't use with nvimtree)
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Map 'jj' to '<Esc>'
vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = true })

-- Allows moving entire lines up and down like VSCode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Grabs line below cursor and appends it to your current line with a space
vim.keymap.set("n", "J", "mzJ`z")

-- Keeps the curson in the middle of the buffer when jumping up/down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keeps the curson in the middle while navigating search terms
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Allows you to paste over text without losing the text you are pasting
-- Ex. normally copy foo and try to past over bar will work, but after you
-- paste over bar, bar is now in your past register and if you hit p again
-- you will past bar. This keymap keeps foo in the register
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Yanks to the system clipboard to allow pasting into other buffers/apps
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Disables Q function in vim
vim.keymap.set("n", "Q", "<nop>")

-- Opens up the tmux sessionizer
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Formats current buffer with lsp
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Quickfix navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Jump into find and replace for entire buffer
vim.keymap.set("n", "<leader>fr", [[:%s/]])

-- Jump into a find and replace for word under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Set the current files as an executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Source the current file
vim.keymap.set("n", "<leader><leader>", function()
	vim.cmd("so")
	print("sourced current file")
end)

-- Print 80 '=' chars to the screen. Using for todo serperation
vim.keymap.set("n", "<Leader>==", ":put =repeat('=', 80)<CR>", { noremap = true, silent = true })

-- Markdown Preview
vim.keymap.set("n", "<leader>md", function()
	vim.cmd("MarkdownPreview")
	print("opening markdown file in browser")
end, { noremap = true, silent = true })

-- Run eslint on current buffer if it is a ts or js file
vim.keymap.set("n", "<leader>lf", function()
	local file = vim.fn.expand("%:t")
	if file:match("%.tsx?$") or file:match("%.jsx?$") then
		vim.cmd("!yarn eslint --fix %")
	else
		print("Not a TypeScript or JavaScript file")
	end
end, { noremap = true, silent = true })
