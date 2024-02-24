-- Initialization settings
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.o.statuscolumn =
	'%=%l%s%#FoldColumn#%{foldlevel(v:lnum) > foldlevel(v:lnum - 1) ? (foldclosed(v:lnum) == -1 ? " " : " ") : "  " }%*'

-- Configuration options with custom fold_virt_text_handler
local opts = {
	open_fold_hl_timeout = 400,
	close_fold_kinds = { "imports", "comment" },
	preview = {
		win_config = {
			border = { "", "─", "", "", "", "─", "", "" },
			winblend = 0,
		},
		mappings = {
			scrollU = "<C-u>",
			scrollD = "<C-d>",
			jumpTop = "[",
			jumpBot = "]",
		},
	},
	fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
		local newVirtText = {}
		local totalLines = vim.api.nvim_buf_line_count(0)
		local foldedLines = endLnum - lnum
		local suffix = ("  %d %d%%"):format(foldedLines, math.floor(foldedLines / totalLines * 100))
		local sufWidth = vim.fn.strdisplaywidth(suffix)
		local targetWidth = width - sufWidth
		local curWidth = 0
		for _, chunk in ipairs(virtText) do
			local chunkText = chunk[1]
			local chunkWidth = vim.fn.strdisplaywidth(chunkText)
			if targetWidth > curWidth + chunkWidth then
				table.insert(newVirtText, chunk)
				curWidth = curWidth + chunkWidth
			else
				chunkText = truncate(chunkText, targetWidth - curWidth)
				table.insert(newVirtText, { chunkText, chunk[2] }) -- Keep original hlGroup
				break -- No need to process further as we've filled the line
			end
		end
		-- Ensure the suffix is right-aligned
		if curWidth < targetWidth then
			table.insert(newVirtText, { " " .. suffix, "NonText" }) -- Padding for alignment
		else
			table.insert(newVirtText, { suffix, "NonText" })
		end
		return newVirtText
	end,
}

-- Setup ufo with the options
require("ufo").setup(opts)

-- Key mappings
vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
vim.keymap.set("n", "K", function()
	local winid = require("ufo").peekFoldedLinesUnderCursor()
	if not winid then
		-- Uncomment the line you wish to use for hover
		-- vim.lsp.buf.hover()
		vim.cmd([[ Lspsaga hover_doc ]])
	end
end)
