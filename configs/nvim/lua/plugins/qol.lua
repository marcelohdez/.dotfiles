return {
	{
		"kawre/leetcode.nvim",
		build = ":TSUpdate html",
		lazy = "leet" ~= vim.fn.argv()[1],
		opts = { arg = "leet" },
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
		keys = {
			{ "<leader>po", "<cmd>Leet lang<cr>", desc = "Change language" },
			{ "<leader>pp", "<cmd>Leet desc<cr>", desc = "Show problem description" },
			{ "<leader>pl", "<cmd>Leet list<cr>", desc = "List all problems" },
			{ "<leader>pi", "<cmd>Leet run<cr>", desc = "Run solution" },
			{ "<leader>ps", "<cmd>Leet submit<cr>", desc = "Submit solution" },
			{ "<leader>pO", "<cmd>Leet open<cr>", desc = "Open in browser" },
			{ "<leader>pL", "<cmd>Leet last_submit<cr>", desc = "Load last submition" },
			{ "<leader>pR", "<cmd>Leet yank<cr>", desc = "Reset problem" },
		},
	},
	{
		"folke/which-key.nvim",
		opts = {
			defaults = {
				["<leader>p"] = { name = "+LeetCode" },
			},
		},
	},

	-- changes to lazyvim defaults
	"ellisonleao/gruvbox.nvim",
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "gruvbox",
		},
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		opts = {
			filesystem = {
				hijack_netrw_behavior = "open_current",
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
	{
		"nvimdev/dashboard-nvim",
		opts = {
			config = {
				header = vim.split(string.rep("\n", 8) .. [[
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

	-- disable stuffs
	{
		"folke/noice.nvim",
		enabled = false,
	},
	{
		"nvim-lualine/lualine.nvim",
		enabled = false,
	},
}
