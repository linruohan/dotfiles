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
map("i","jj","ESC")
map("i", "jk", "<ESC>")
map("v",">",">gv")
map("n", "<leader>fm", function()
  require("conform").format()
end, { desc = "File Format with conform" })

-- switch tab files : shift+l :next ; shift+h :prev; leader+x: close;
map("n", "<S-l>", function()
  require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })
map("n", "<S-h>", function()
  require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })
-- map("n", "<leader>x", function()
  -- require("nvchad.tabufline").close_buffer()
-- end, { desc = "buffer close" })
map("n", "<C-f>", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<C-p>", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map("i", "jk", "<ESC>", { desc = "escape insert mode" })

-- Mappings for M.shade
map("n", "<Bslash>", function()
  require("shade").toggle()
end, { desc = "Toggle shade.nvim" })
