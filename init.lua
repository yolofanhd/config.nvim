-- LEADER
-- These keybindings need to be defined before the first /
-- is called; otherwise, it will default to "\"
vim.g.mapleader = "<Space>"
vim.g.localleader = "<Space>"

local cmp = require "cmp"
local nvim_lsp = require "lspconfig"
local lspkind = require "lspkind"
lspkind.init()
local vars = require "vars"
vars.init()
local keys = require "keys"

require "plug"
require "opts"
require "texlab"
require "debug.dap"
require("startup").setup {
  theme = "startify"
}
require("project_nvim").setup {}
require("mason").setup()
require("nvim-ts-autotag").setup()
require("nvim-autopairs").setup {}
require("telescope").setup {
  defaults = {
    file_ignore_patterns = { "node_modules" }
  }
}
require("telescope").load_extension("projects")
require("nvim-tree").setup {
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = true
  }
}
require("lualine").setup {
  options = {
    theme = 'gruvbox'
  }
}

require('nvim-treesitter.configs').setup {
  ensure_installed = "all",
  sync_install = false,
  ignore_install = { "phpdoc" },
  highlight = {
    enable = true,
    disable = { "" },
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
    disable = { "" },
  },
  autotag = {
    enable = true,
  },
}

-- Init all lsp servers
local capabilities = require('cmp_nvim_lsp').default_capabilities()
for _, lsp in ipairs(vars.servers) do
  nvim_lsp[lsp].setup {
    capabilities = capabilities,
    on_attach = keys.addLsp,
  }
end


keys.addDefaults()
keys.addNavigation()
cmp.setup {
  mapping = keys.cmp,
  sources = vars.cmp.sources,
  snippet = vars.cmp.snippet,
  formatting = vars.cmp.formatting,
  experimental = vars.cmp.experimental
}
