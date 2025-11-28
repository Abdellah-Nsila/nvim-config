-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.shiftwidth = 4
vim.clipboard = "unnamedplus"
vim.number = true

if true then
    print("TODO: Push your nvim-setup-config Repo")
end

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")


