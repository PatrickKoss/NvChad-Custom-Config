require "nvchad.mappings"

local map = vim.keymap.set

-- Your custom mappings
map("n", ";", ":", { desc = "CMD enter command mode", nowait = true })
map("i", "jk", "<ESC>")
map("n", "<C-w>", "<cmd>bd<CR>", { desc = "Close buffer" })
map("n", "<leader>gg", "<cmd>!golines . -w<CR>", { desc = "Run golines" })
map("n", "<leader>bb", "<cmd>!black .<CR>", { desc = "Run black" })
