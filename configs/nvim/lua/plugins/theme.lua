return {
	{ "LazyVim/LazyVim", opts = { colorscheme = "lunaperche" } },

	{
		"f-person/auto-dark-mode.nvim",
		opts = {
			set_dark_mode = function()
				vim.api.nvim_set_option_value("background", "dark", {})
			end,
			set_light_mode = function()
				vim.api.nvim_set_option_value("background", "light", {})
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
