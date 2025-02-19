return {
	"nyoom-engineering/oxocarbon.nvim",
	{ "LazyVim/LazyVim", opts = { colorscheme = "oxocarbon" } },

	{
		"f-person/auto-dark-mode.nvim",
		opts = {
			set_dark_mode = function()
				vim.api.nvim_set_option_value("background", "dark", {})
				vim.cmd("colorscheme oxocarbon")
			end,
			set_light_mode = function()
				vim.api.nvim_set_option_value("background", "light", {})
				vim.cmd("colorscheme lunaperche")
			end,
			fallback = "light",
		},
	},

	{
		"folke/snacks.nvim",
		opts = {
			dashboard = {
				preset = {
					header = [[
 _      _ _    _ 
| |__  (_) | _| |
| '_ \ | | |/ / |
| | | || |   <| |
|_| |_|/ |_|\_\_|
|__/  ]],
				},
			},
		},
	},
}
