vim.cmd([[packadd packer.nvim]])
return require("packer").startup(function()
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- To use ranger
	use("kevinhwang91/rnvimr")

	-- lua functions
	use("nvim-lua/plenary.nvim")

	-- icons for other plugins
	use("kyazdani42/nvim-web-devicons")
	use("akinsho/bufferline.nvim")
	use("windwp/windline.nvim")

	-- termial integration
	use("akinsho/nvim-toggleterm.lua")

	-- color scheme
	use("lunarvim/colorschemes")
	use("lunarvim/darkplus.nvim")

	-- zotero cite
	use("jalvesaq/zotcite")

	-- tagbar
	use("simrat39/symbols-outline.nvim")

	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")
	--use({ "neoclide/coc.nvim", branch = "release", run = "yarn install --frozen-lockfile" })

	-- snippet support
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use
	use("saadparwaiz1/cmp_luasnip")

	-- lsp support
	use("neovim/nvim-lspconfig")
	use("williamboman/nvim-lsp-installer") -- simple to use language server installer
	use("tamago324/nlsp-settings.nvim") -- language server settings defined in json for
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
	-- use("glepnir/lspsaga.nvim")

	-- dap support
	use("mfussenegger/nvim-dap")
	use( "rcarriga/nvim-dap-ui" )
	use("theHamsta/nvim-dap-virtual-text")
	use("Pocco81/DAPInstall.nvim")

	-- Telescope
	use("nvim-telescope/telescope.nvim")

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- auto pairs
	use("windwp/nvim-autopairs")

	-- surround with
	use("blackCauldron7/surround.nvim")

	use("lukas-reineke/indent-blankline.nvim")

	-- Easily comment stuff
	use("numToStr/Comment.nvim")

	use("folke/which-key.nvim")

	-- Undotree
	use("mbbill/undotree")

	-- suda
	use("lambdalisue/suda.vim")

	-- Git
	use("lewis6991/gitsigns.nvim")
	use("kdheepak/lazygit.nvim")

	-- vimscript to lua
	use("thugcee/nvim-map-to-lua")

	-- markdown
	use({ "iamcco/markdown-preview.nvim", ft = "markdown", run = "cd app && yarn install" })
end)
