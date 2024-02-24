-- This file is prefixed with a "z_" so that it runs last after all other plugins have loaded
-- Neovim parses the after/ directory top to bottom
function SetMyColorScheme(color)
	-- 	dark theme
	color = color or "github_dark_dimmed"
	--  light theme
	-- color = color or "github_light"
	vim.cmd.colorscheme(color)

	-- Set window transparent
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

SetMyColorScheme()
