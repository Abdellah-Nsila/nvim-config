-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.shiftwidth = 4
vim.clipboard = "unnamedplus"
vim.number = true

local hadik = 5
print(hadik)

if true then
	print("TODO: Push your nvim-setup-config Repo")
end

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
