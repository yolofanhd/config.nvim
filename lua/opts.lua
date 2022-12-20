local opt = vim.opt
local cmd = vim.api.nvim_command
local autocmd = vim.api.nvim_create_autocmd

-- [[ LSP ]]
vim.o.completeopt="menu,menuone,noselect"

-- [[ Tresitter folding ]]
opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()'
opt.foldnestmax = 1
opt.foldminlines = 20

-- [[ Theme ]]
opt.syntax = "OFF"                -- str:  Allow syntax highlighting
opt.termguicolors = true         -- bool: If term supports ui color then enable

-- [[ Filetypes ]]
opt.encoding = 'utf8'            -- str:  String encoding to use
opt.fileencoding = 'utf8'        -- str:  File encoding to use

opt.colorcolumn = '80'           -- str:  Show col for max line length

opt.number = true                -- bool: Show line numbers
opt.relativenumber = true        -- bool: Show relative line numbers
opt.scrolloff = 4                -- int:  Min num lines of context
opt.signcolumn = "auto"            -- str:  Show the sign column

-- [[ Tab Settings ]]
opt.expandtab = true             -- bool: Use spaces instead of tabs
opt.shiftwidth = 2               -- num:  Size of an indent
opt.softtabstop = 2              -- num:  Number of spaces tabs count for in insert mode
opt.tabstop = 2                  -- num:  Number of spaces tabs count for

-- [[ Splits ]]
opt.splitright = true            -- bool: Place new window to right of current one
opt.splitbelow = true            -- bool: Place new window below the current one

-- [[ Only enable spelling in a few filetypes ]]
autocmd(
    { "BufRead", "BufNewFile" },
    { pattern = { "*.txt", "*.md", "*.tex" }, command = "setlocal spell spelllang=de_at" }
)
