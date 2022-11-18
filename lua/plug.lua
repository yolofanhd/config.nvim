return require("packer").startup(function(use)
	-- [[ Platformio (for microcontroller programming) ]]
	use({ "normen/vim-pio" })

	-- [[ Project plugin ]]
	use({ "ahmedkhalf/project.nvim" })

	-- [[ VimTex Latex support]]
	use({ "lervag/vimtex" })

	-- [[ Screenshots ]]
	use({ "asamonik/nvim-screenshot", run = "go build" })

	-- [[ HTML auto tag close & rename ]]
	use({ "windwp/nvim-ts-autotag" })

	-- [[ Tetris (:tetris) ]]
	use({ "alec-gibson/nvim-tetris" })

	-- [[ CSS Color (Highlights colors in code) ]]
	use({ "ap/vim-css-color" })

	-- [[ Formatter ]]
	use({ "sbdchd/neoformat" })

	-- [[ LSP-server installer ]]
	use({ "williamboman/mason.nvim" })

	-- [[ LSP ]]
	use({ "neovim/nvim-lspconfig" })
	use({ "onsails/lspkind.nvim" })

	-- [[ Snippet engine ]]
	use({ "L3MON4D3/LuaSnip" })

	-- [[ Completion ]]
	use({ "hrsh7th/nvim-cmp" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-path" })
	use({ "hrsh7th/cmp-nvim-lua" })
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "saadparwaiz1/cmp_luasnip" })

	-- [[ Treesitter ]]
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})

	-- [[ NVIM Tree ]]
	use({
		"kyazdani42/nvim-tree.lua",
		requires = "kyazdani42/nvim-web-devicons",
	})

	-- [[ Theme ]]
	use({
		"startup-nvim/startup.nvim",
		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			require("startup").setup()
		end,
	})

	-- [[ Shows animation on cursor jump ]]
	use({ "DanilaMihailov/beacon.nvim" })

	-- [[ Bottom status line ]]
	use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } })

	use({ "luisiacc/gruvbox-baby" })

	-- [[ Telescope (fuzzy finder and way more) ]]
	use({ "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/plenary.nvim" } } })

	-- [[ Used for bottom tag bar ]]
	use({ "majutsushi/tagbar" })

	-- [[ Shows nice bar each indent ]]
	use({ "Yggdroot/indentLine" })

	-- [[ Git integration ]]
	use({ "tpope/vim-fugitive" })

	-- [[ Commit history ]]
	use({ "junegunn/gv.vim" })

	-- [[ Brackets pairing ]]
	use({ "windwp/nvim-autopairs" })

	-- [[ Debugging ]]
  use({ "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"}})
  use({ "mfussenegger/nvim-dap-python" })


end, { config = {
	package_root = vim.fn.stdpath("config") .. "/site/pack",
} })
