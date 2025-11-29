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

      vim.lsp.enable("lua_ls")
    end,
  }
}

