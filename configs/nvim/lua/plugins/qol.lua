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

			-- optional
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
			"rcarriga/nvim-notify",
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

	-- changes to lazyvim defaults
	"ellisonleao/gruvbox.nvim",
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "gruvbox",
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
		"folke/which-key.nvim",
		opts = {
			defaults = {
				["<leader>p"] = { name = "+LeetCode" },
			},
		},
	},
}
