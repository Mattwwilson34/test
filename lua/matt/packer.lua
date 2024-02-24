local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
-- Packer package manager
	use("wbthomason/packer.nvim")

	-- Telescope - fuzzy finder
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- Github colorscheme
	use({ "projekt0n/github-nvim-theme" })

	-- Treesitter - code syntax highlighter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- Trouble
	use({ "folke/trouble.nvim" })

	-- Improved Folding UFO
	use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })

	-- Indent Black Line
	use({ "lukas-reineke/indent-blankline.nvim" })

	-- Formater
	use({
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup()
		end,
	})

	-- Harpoon - quick file switcher
	use("ThePrimeagen/harpoon")

	-- Undo Tree - Git like undo history
	use("mbbill/undotree")

	-- Vim Fugitive - Git Integration
	use("tpope/vim-fugitive")

	-- nvimtree
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional
		},
	})

	-- lualine
	use({ "nvim-lualine/lualine.nvim" })

	-- Tmux split pane navigator
	use({ "christoomey/vim-tmux-navigator" })

	-- Startup Screen plugin
	use({
		"goolord/alpha-nvim",
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	})

	-- Comment plugin
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	-- Spell checker plugin
	use({ "kamykn/spelunker.vim" })

	-- Yarn plugin for zip files and SDK integratin
	use({ "lbrayner/vim-rzip" })

	-- Markdown Preview
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})

	-- LSP-zero
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		requires = {
			--- Uncomment these if you want to manage LSP servers from neovim
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "L3MON4D3/LuaSnip" },
		},
	})

    if packer_bootstrap then
        require('packer').sync()
    end
end)
