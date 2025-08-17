-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- vim options
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.showtabline = 2
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.conceallevel = 0
vim.opt.fileencoding = "UTF-8"
vim.opt.guifont = "FiraCode Nerd Font:h30"
vim.g.neovide_scale_factor = 50.2
vim.opt.hidden = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.mouse = "a"
vim.opt.cursorline = true
vim.opt.wrap = true
vim.opt.cursorline = true
vim.opt.relativenumber = true
-- vim.opt.shell = "/bin/sh"
vim.opt.smartindent = true
vim.opt.smartcase = true
vim.opt.termguicolors = true
vim.lsp.handlers["textDocument/inlayHint"] = function(...) end

vim.g.autoformat = true
