-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.api.nvim_create_autocmd("ModeChanged", {
	group = vim.api.nvim_create_augroup("inlayhints", { clear = true }),
	callback = function()
		-- vim.notify(vim.v.event.new_mode, vim.log.levels.ERROR)
		-- Enable inlay hints if *not* in visual or insert modes
		vim.lsp.inlay_hint.enable(string.match("vVi", vim.v.event.new_mode) == nil, { bufnr = 0 })
	end,
})
