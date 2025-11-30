return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"folke/lazydev.nvim",
				ft = "lua",
				opts = {
					library = {
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
		},

		config = function()
			vim.lsp.config["lua_ls"] = {
				cmd = { "lua-language-server" },
				filetypes = { "lua" },
				root_markers = { { ".luarc.json", ".luarc.jsonc" }, ".git" },

				settings = {
					Lua = {
						runtime = {
							version = "LuaJIT",
						},
						diagnostics = {
							globals = { "vim" }, -- ENABLE "undefined global vim" fix
						},
						workspace = {
							checkThirdParty = false,
							library = {
								vim.env.VIMRUNTIME,
							},
						},
						telemetry = { enable = false },
					},
				},
			}



			vim.api.nvim_create_autocmd('LspAttach', {
				group = vim.api.nvim_create_augroup('my.lsp', {}),
				callback = function(args)
					local c = assert(vim.lsp.get_client_by_id(args.data.client_id))
					-- if c:supports_method('textDocument/implementation') then
					-- Create a keymap for vim.lsp.buf.implementation ...
					-- end

					-- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
					-- if c:supports_method('textDocument/completion') then
					-- Optional: trigger autocompletion on EVERY keypress. May be slow!
					-- local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
					-- c.server_capabilities.completionProvider.triggerCharacters = chars

					--	vim.lsp.completion.enable(true, c.id, args.buf, { autotrigger = true })
					-- end

					-- Auto-format ("lint") on save.
					-- Usually not needed if server supports "textDocument/willSaveWaitUntil".
					if not c:supports_method('textDocument/willSaveWaitUntil')
						and c:supports_method('textDocument/formatting') then
						vim.api.nvim_create_autocmd('BufWritePre', {
							group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
							buffer = args.buf,
							callback = function()
								vim.lsp.buf.format({ bufnr = args.buf, id = c.id, timeout_ms = 1000 })
							end,
						})
					end
				end,
			})

			vim.lsp.enable("lua_ls")
		end,
	}
}
