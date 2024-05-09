-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>T", function()
	if os.execute("$TERMINAL &") ~= 0 then
		vim.notify("Failed to launch terminal.", 1)
	end
end)
