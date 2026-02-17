return {
	{
		"stevearc/oil.nvim",
		lazy = false,
		opts = {
			lsp_file_methods = {
				autosave_changes = "unmodified",
			},
		},
		keys = {
			{ "<leader>fe", "<cmd>Oil<cr>", desc = "Open Oil File Explorer" },
		},
	},
}
