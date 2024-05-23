return {
	-- Add to lazyvim defaults
	-- "ellisonleao/gruvbox.nvim",
	"rose-pine/neovim",
	{ "LazyVim/LazyVim", opts = { colorscheme = "default" } },
	{
		"nvimdev/dashboard-nvim",
		opts = {
			config = {
				header = vim.split(string.rep("\n", 10) .. [[
 ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓
 ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒
▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░
▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██ 
▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒
░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░
░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░
   ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░
         ░    ░  ░    ░ ░        ░   ░         ░
                                ░
          ]] .. "\n\n", "\n"),
			},
		},
	},
	{
		"rcarriga/nvim-notify",
		opts = {
			level = 3,
			render = "wrapped-compact",
		},
	},

	-- disable stuffs
	{
		"folke/noice.nvim",
		opts = {
			cmdline = {
				enabled = false,
			},
			messages = {
				enabled = false,
			},
			popupmenu = {
				enabled = false,
			},
		},
	},
	{ "folke/persistence.nvim", enabled = false },
	{ "folke/which-key.nvim", enabled = false }, -- never works when u want it 😡
	{ "nvim-lualine/lualine.nvim", enabled = false },
}
