return {
	{
		'stevearc/oil.nvim',
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {
			-- Set 'skip_hidden' to false to display hidden (dot) files by default
			-- If you also want to *toggle* this setting easily:
			keymaps = {
				["<leader>oh"] = "actions.toggle_hidden",
			},
			view_options = {
				show_hidden = true,
				is_hidden_file = function(name, bufnr)
					local m = name:match("^%.")
					return m ~= nil
				end,
				is_always_hidden = function(name, bufnr)
					return false
				end,
			},
		},
		-- Optional dependencies
		dependencies = { { "nvim-mini/mini.icons", opts = {} } },
		-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
		-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
		lazy = false,
	}
}
