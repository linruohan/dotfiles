-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local utils = require("config.utils")

-- Yank All Text
vim.keymap.set("n", "<leader>y", "<cmd>%y+<cr>", { desc = "Yank All Text", silent = true })

-- Delete All Text
vim.keymap.set("n", "<leader>bR", "<cmd>%d+<cr>", { desc = "Remove All Text", silent = true })

-- Save With Root
vim.keymap.set("n", "<leader>bs", "<cmd>SudaWrite<cr>", { desc = "Save With Root", silent = true })

-- Go to previous tab
vim.keymap.set("n", "<S-h>", "<cmd>tabprevious<CR>", { desc = "General | Go to previous tab", silent = true })

-- Go to next tab
vim.keymap.set("n", "<S-l>", "<cmd>tabnext<CR>", { desc = "General | Go to next tab", silent = true })

-- New tab
vim.keymap.set("n", "<S-n>", "<cmd>tabnew<CR>", { desc = "General | New tab", silent = true })

-- Close tab
vim.keymap.set("n", "<leader>x", "<cmd>tabclose<CR>", { desc = "General | Close tab", silent = true })

-- Run Code
vim.keymap.set("n", "<leader>ce", function()
  utils.run_code()
end, { desc = "Execute Code", silent = true })

-- Project Bootstrap
vim.keymap.set("n", "<leader>P", function()
  utils.bootstrap_project()
end, { desc = "Project Bootstrap", silent = true })

-- lazy
vim.keymap.set("n", "<leader>lh", "<cmd>Lazy<cr>", { desc = "Lazy Home" })
vim.keymap.set("n", "<leader>le", "<cmd>LazyExtras<cr>", { desc = "Lazy Extras" })
vim.keymap.set("n", "<leader>ls", "<cmd>Lazy sync<cr>", { desc = "Lazy Sync" })
vim.keymap.set("n", "<leader>lu", "<cmd>Lazy update<cr>", { desc = "Lazy Update" })
vim.keymap.set("n", "<leader>lL", "<cmd>Lazy log<cr>", { desc = "Lazy Log" })
vim.keymap.set("n", "<leader>lc", "<cmd>Lazy clean<cr>", { desc = "Lazy Clean" })
vim.keymap.set("n", "<leader>lp", "<cmd>Lazy profile<cr>", { desc = "Lazy Profile" })
vim.keymap.set("n", "<leader>li", "<cmd>Lazy install<cr>", { desc = "Lazy Install" })
vim.keymap.set("n", "<leader>ll", function()
  local keys = vim.api.nvim_replace_termcodes(":Lazy load ", true, false, true)
  vim.api.nvim_feedkeys(keys, "n", false)
end, { desc = "Load Plugin" })
vim.keymap.set("n", "<leader>lH", "<cmd>Lazy help<cr>", { desc = "Lazy Help" })
vim.keymap.set("n", "<leader>ld", "<cmd>Lazy debug<cr>", { desc = "Lazy Debug" })

-- From: https://medium.com/@musickcorym/fixing-the-lag-why-i-ditched-vim-tmux-navigator-for-a-faster-plugin-free-setup-239da138e4aa
local function smart_move(direction, tmux_cmd)
  local curwin = vim.api.nvim_get_current_win()
  vim.cmd("wincmd " .. direction)
  if curwin == vim.api.nvim_get_current_win() then
    vim.fn.system("tmux select-pane " .. tmux_cmd)
  end
end

vim.keymap.set("n", "<C-h>", function()
  smart_move("h", "-L")
end, { silent = true })
vim.keymap.set("n", "<C-j>", function()
  smart_move("j", "-D")
end, { silent = true })
vim.keymap.set("n", "<C-k>", function()
  smart_move("k", "-U")
end, { silent = true })
vim.keymap.set("n", "<C-l>", function()
  smart_move("l", "-R")
end, { silent = true })

vim.keymap.set("n", "<leader>uC", function()
  if vim.g.colorscheme == "nvchad" then
    require("config.utils").theme_picker.open()
  else
    Snacks.picker.colorschemes()
  end
end, { desc = "Colorschemes" })

local map = vim.keymap.set
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map("n",";",":")
map("n","<C-w>","<cmd> bd <CR>", { desc = "close file"})
-- ctrl + p 搜索文件
map("n", "<C-p>", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
-- ctrl + f grep 关键字
map("n", "<C-f>", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n","<leader>gg","<cmd> !golines . -w <CR>", { desc ="run golines"})
map("n","<leader>bb","<cmd> !black . <CR>", { desc ="run black"})
map("n","S",":w!<cr>")
map("n","Q",":q!<cr>")
map("n","<leader>w",":w!<cr>")
map("n","<leader>q",":q!<cr>")
map("n","=","n")
map("n","-"," N")
map("n","<C-s>",":w<cr>")
map("i","jj","ESC")
map("i", "jk", "<ESC>")
map("v",">",">gv")


map("i", "jk", "<ESC>", { desc = "escape insert mode" })
