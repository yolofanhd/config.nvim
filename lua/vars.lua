local g = vim.g
local variables = {}
local lspkind = require "lspkind"

variables.init = function ()
  -- color settings
  g.t_co = 256
  g.background = "dark"

  -- Update the packpath
  local packer_path = vim.fn.stdpath('config') .. '/site'
  vim.o.packpath = vim.o.packpath .. ',' .. packer_path

  -- Style
  g.gruvbox_baby_function_style = "NONE"
  g.gruvbox_baby_keyword_style = "italic"

  -- Telescope theme
  g.gruvbox_baby_telescope_theme = 1

  -- Start menu bookmarks
  g.startup_bookmarks = {
    ["C"] = '~/.config/nvim/init.lua',    -- path of your nvim config
    ["O"] = '/media/hdd/Office/Office',   -- Some other paths
    ["S"] = '/media/hdd/Office/School',
    ["P"] = '/media/hdd/Office/Private',
  }

  -- Enable transparent mode
  g.gruvbox_baby_transparent_mode = 1
  g.gruvbox_baby_use_original_palette = 1

  -- Use gruvbox_baby colorscheme
  vim.cmd[[colorscheme gruvbox-baby]]
end

variables.servers = {
  "angularls",
  "html",
  "cssls",
  "tsserver",
  "jsonls",
  "sumneko_lua",
  "tailwindcss",
  "grammarly",
  "cssmodules_ls",
  "eslint",
  "prismals",
  "sqlls",
  "texlab",
  "pyright",
  "julials"
}

variables.cmp = {
  sources = {
    --{ name = "gh_issues" },
    { name = "nvim_lua" },
    { name = "nvim_lsp" },
    { name = "path" },
    { name = "luasnip" },
    { name = "buffer", keyword_length = 5 },
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  formatting = {
    format = lspkind.cmp_format {
      with_text = true,
      menu = {
        buffer = "[buf]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[LUA]",
        path = "[path]",
        luasnip = "[snip]",
        --gh_issues = "[issues]",
      },
    },
  },
}

return variables
