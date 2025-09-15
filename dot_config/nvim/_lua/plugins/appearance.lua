return {
	{ "nvim-tree/nvim-web-devicons" },
	{ "Mofiqul/vscode.nvim", priority = 100, },
	{
		"https://gitlab.com/bartekjaszczak/luma-nvim",
		priority = 100,
		opts = {
			theme = "dark",      -- "dark" or "light" theme
			contrast = "medium", -- "low", "medium" or "high" contrast
		},
		enabled = false,
	},
	{
		"f-person/auto-dark-mode.nvim",
		opts = {
			update_interval = 1000,
			set_dark_mode = function()
				vim.api.nvim_set_option_value("background", "dark", {})
				vim.cmd("colorscheme vscode")
			end,
			set_light_mode = function()
				vim.api.nvim_set_option_value("background", "light", {})
				vim.cmd("colorscheme vscode")
			end,
		},
	},
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {},
	},
	{
		"sschleemilch/slimline.nvim",
		opts = {}
	},
}
