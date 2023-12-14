return {
	{
		"Dhanus3133/Leetbuddy.nvim",
		config = function()
			require("leetbuddy").setup({})
		end,
		keys = {
			{ "<leader>pp", "<cmd>LBQuestion<cr>", desc = "Show problem description" },
			{ "<leader>pl", "<cmd>LBQuestions<cr>", desc = "List all problems" },
			{ "<leader>pi", "<cmd>LBTest<cr>", desc = "Test code" },
			{ "<leader>ps", "<cmd>LBSubmit<cr>", desc = "Submit code" },
			{ "<leader>pR", "<cmd>LBReset<cr>", desc = "Reset problem" },
			{ "<leader>pX", "<cmd>LBClose<cr>", desc = "Close problem" },
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
