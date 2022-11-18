local map = vim.keymap.set
local keymaps = {}
local cmp = require "cmp"

keymaps.addDefaults = function()
  -- [[ Nvim Tree Keymaps ]]
  map('n', 'n', [[:NvimTreeToggle<cr>]], { silent = true })

  -- [[ Telescope Keymaps ]]
  map('n', 'ff', [[:Telescope find_files<cr>]], { silent = true })
  map('n', 'fp', [[:Telescope projects<cr>]], { silent = true })

  -- [[ Open a terminal ]]
  map('n', 't', [[:split term://bash<cr>]], { silent = true })

  -- [[ LuaSnip ]]
  map('i', '<C-K>', [[<cmd>lua require'luasnip'.jump(1)<cr>]], {silent = true})
  map('i', '<C-L>', [[<cmd>lua require'luasnip'.jump(-1)<cr>]], {silent = true})

  -- [[ Debugging ]]
  map('n', '<F4>', [[<cmd>lua require'dapui'.open()<cr>]], {silent = true})
  map('n', '<F5>', [[<cmd>lua require'dap'.continue()<cr>]], {silent = true})
  map('n', '<F1>', [[<cmd>lua require'dap'.step_into()<cr>]], {silent = true})
  map('n', '<F2>', [[<cmd>lua require'dap'.step_over()<cr>]], {silent = true})
  map('n', '<F3>', [[<cmd>lua require'dap'.step_out()<cr>]], {silent = true})
  map('n', '<Space>b', [[<cmd>lua require'dap'.toggle_breakpoint()<cr>]], {silent = true})
  map('n', '<Space>B', [[<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Condition: '))<cr>]], {silent = true})
  map('n', '<Space>dr', [[<cmd>lua require'dap'.repl.open()<cr>]], {silent = true})


  -- [[ Python test debug ]]
  map('n', '<F9>', [[<cmd>lua require'dap-python'.test_method()<cr>]], {silent = true})
  map('n', '<F10>', [[<cmd>lua require'dap-python'.test_class()<cr>]], {silent = true})
  map('n', '<F11>', [[<cmd>lua require'dap-python'.debug_selection()<cr>]], {silent = true})



end

keymaps.addNavigation = function()
  map('n', 'j', '<Left>', {})
  map('n', 'l', '<Up>', {})
  map('n', 'k', '<Down>', {})
  map('n', 'ö', '<Right>', {})

  map('n', '<C-w>j', '<C-w><Left>', {})
  map('n', '<C-w>l', '<C-w><Up>', {})
  map('n', '<C-w>k', '<C-w><Down>', {})
  map('n', '<C-w>ö', '<C-w><Right>', {})

  map('t', '<Esc>', '<C-Bslash><C-n>', {})
  map('i', '<Capital>', '<Esc>', {})
end

keymaps.cmp = {
  ["<C-Space>"] = cmp.mapping.complete(),
  ["<C-k>"] = cmp.mapping.select_next_item(),
  ["<C-l>"] = cmp.mapping.select_prev_item(),
  ["<C-d>"] = cmp.mapping.scroll_docs(-4),
  ["<C-f>"] = cmp.mapping.scroll_docs(4),
  ["<C-e>"] = cmp.mapping.close(),
  ["<C-y>"] = cmp.mapping.confirm {
    behavior = cmp.ConfirmBehavior.Insert,
    select = true,
  },
}

keymaps.addLsp = function(client, bufnr)

  local lsp = vim.lsp.buf
  map("n", "K", lsp.hover, {buffer=0})
  map("n", "gd", lsp.definition, {buffer=0})
  map("n", "gi", lsp.implementation, {buffer=0})
  map("n", "gt", lsp.type_definition, {buffer=0})
  map("n", "<space>dö", vim.diagnostic.goto_next, {buffer=0})
  map("n", "<space>dj", vim.diagnostic.goto_next, {buffer=0})
  map("n", "<space>dl", ":Telescope diagnostics<cr>", {buffer=0})
  map("n", "<space>r", vim.lsp.buf.rename, {buffer=0})
end

return keymaps
