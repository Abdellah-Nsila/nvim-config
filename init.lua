-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.signcolumn = 'yes'
vim.opt.scrolloff = 10
vim.opt.list = true
vim.opt.listchars = { tab = '→  ', trail = '*', space = '.' }

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<m-k>", "<cmd>cprev<CR>")

vim.keymap.set("n", "<ESC>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Hightlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
vim.api.nvim_create_autocmd('TermOpen', {
	group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
	callback = function()
		vim.opt.number = false
		vim.opt.relativenumber = false
	end
})

local job_id = 0
vim.keymap.set("n", "<space>st", function()
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 15)

	job_id = vim.bo.channel
end)

vim.keymap.set("n", "<space>example", function()
	vim.fn.chansend(job_id, { "ls -al\r\n" })
end)
