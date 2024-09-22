-- add yours here

local map = vim.keymap.set
map("n", ";", ":", { desc = "CMD enter command mode" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
require "nvchad.mappings"
map("n",";",":")
map("n","<C-w>","<cmd> bd <CR>", { desc = "close file"})
map("n","<leader>gg","<cmd> !golines . -w <CR>", { desc ="run golines"})
map("n","<leader>bb","<cmd> !black . <CR>", { desc ="run black"})
map("n","S",":w!<cr>")
map("n","Q",":q!<cr>")
map("n","<leader>w",":w!<cr>")
map("n","<leader>q",":q!<cr>")
map("n","=","n")
map("n","-"," N")
map("n","<C-s>",":w<cr>")
map("n","<S-l>",":BufferLineCycleNext<CR>")
map("n","<S-h>",":BufferLineCyclePrev<CR>")
map("i","jj","ESC")
map("i", "jk", "<ESC>")
map("v",">",">gv")
map("n", "<leader>fm", function()
  require("conform").format()
end, { desc = "File Format with conform" })

map("i", "jk", "<ESC>", { desc = "escape insert mode" })

-- Mappings for M.shade
map("n", "<Bslash>", function()
  require("shade").toggle()
end, { desc = "Toggle shade.nvim" })
