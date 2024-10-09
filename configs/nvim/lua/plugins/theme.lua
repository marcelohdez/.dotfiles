return {
	{ "LazyVim/LazyVim", opts = { colorscheme = "lunaperche" } },

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
