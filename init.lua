-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.shiftwidth = 4
vim.clipboard = "unnamedplus"
vim.number = true
vim.tabstop = 2

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
