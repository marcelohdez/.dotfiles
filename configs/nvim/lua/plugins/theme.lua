return {
	"EdenEast/nightfox.nvim",
	{ "LazyVim/LazyVim", opts = { colorscheme = "nightfox" } },

	"typicode/bg.nvim",
	{
		"f-person/auto-dark-mode.nvim",
		opts = {
			fallback = "light",
			update_interval = 1000,
			set_dark_mode = function()
				vim.api.nvim_set_option_value("background", "dark", {})
				vim.cmd("colorscheme nightfox")
			end,
			set_light_mode = function()
				vim.api.nvim_set_option_value("background", "light", {})
				vim.cmd("colorscheme dayfox")
			end,
		},
	},

	{
		"rcarriga/nvim-notify",
		opts = {
			level = 3,
			render = "wrapped-compact",
		},
	},

	{
		"nvimdev/dashboard-nvim",
		opts = {
			config = {
				header = vim.split(string.rep("\n", 10) .. [[
 _      _ _    _ 
| |__  (_) | _| |
| '_ \ | | |/ / |
| | | || |   <| |
|_| |_|/ |_|\_\_|
|__/
          ]] .. "\n\n", "\n"),
			},
		},
	},
}
