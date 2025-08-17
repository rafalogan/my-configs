-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- No modo normal de terminal
vim.keymap.set("t", "<C-s>", "<C-\\><C-n><cmd>split<cr>", { desc = "Terminal Horizontal Split" })

-- salvar com cs
vim.keymap.set("n", "<C-s>", ":w<CR>", { desc = "Salvar arquivo" })

-- spectre
vim.keymap.set("n", "<leader>S", '<cmd>lua require("spectre").toggle()<CR>', { desc = "Toggle Spectre" })
vim.keymap.set(
  "n",
  "<leader>sw",
  '<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
  { desc = "Search current word" }
)
vim.keymap.set(
  "v",
  "<leader>sw",
  '<esc><cmd>lua require("spectre").open_visual()<CR>',
  { desc = "Search current word" }
)
vim.keymap.set(
  "n",
  "<leader>sp",
  '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
  { desc = "Search on current file" }
)

--RnvimrToggle
vim.keymap.set("n", "<leader>r", ":RnvimrToggle<CR>", { desc = "Toggle Ranger" })

-- auto Save
vim.api.nvim_set_keymap(
  "n",
  "<leader>as",
  ":ASToggle<CR>",
  { noremap = true, silent = true, desc = "Alternar AutoSave" }
)
-- Goto preview
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "gpd", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", opts)
map("n", "gpi", "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", opts)
map("n", "gpr", "<cmd>lua require('goto-preview').goto_preview_references()<CR>", opts)
map("n", "gpt", "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>", opts)
map("n", "gP", "<cmd>lua require('goto-preview').close_all_win()<CR>", opts)
