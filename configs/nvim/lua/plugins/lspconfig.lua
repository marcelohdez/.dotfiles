return {
	-- generated by claude, did not want to figure out how to lspconfig
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				qmlls = {
					cmd = { "qmlls", "-E" },
					filetypes = { "qml" },
					root_dir = function(fname)
						return vim.fs.dirname(vim.fs.find(".git", { path = fname, upward = true })[1])
					end,
				},
			},
		},
	},
}
