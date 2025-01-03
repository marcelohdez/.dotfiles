-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Overrides:
local opt = vim.opt

opt.ruler = true

-- lower scrolloff margin
opt.scrolloff = 2
opt.sidescrolloff = 4

-- show mode in bottom bar
opt.showmode = true

-- limit mouse usage to normal/visual modes
opt.mouse = "nv"

-- add back tildes for buffer end
opt.fillchars = { eob = "~" }

-- disable snacks.nvim animations
vim.g.snacks_animate = false
