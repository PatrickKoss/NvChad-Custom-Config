require "nvchad.mappings"

local map = vim.keymap.set

-- Your custom mappings
map("n", ";", ":", { desc = "CMD enter command mode", nowait = true })
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })
map("n", "<leader>bd", "<cmd>bd<CR>", { desc = "Close buffer" })
map("n", "<leader>x", "<cmd>bd<CR>", { desc = "Close buffer" })
map("n", "<leader>gg", "<cmd>!golines . -w<CR>", { desc = "Run golines" })
map("n", "<leader>bb", "<cmd>!black .<CR>", { desc = "Run black" })

-- ============================================
-- WINDOW NAVIGATION
-- ============================================
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Resize windows with arrows
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase width" })

-- Split windows
map("n", "<leader>sv", "<cmd>vsplit<cr>", { desc = "Split vertical" })
map("n", "<leader>sh", "<cmd>split<cr>", { desc = "Split horizontal" })

-- ============================================
-- LINE MOVEMENT & EDITING
-- ============================================
-- Move lines up/down in visual mode
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- Keep cursor centered when scrolling
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down centered" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up centered" })
map("n", "n", "nzzzv", { desc = "Next search centered" })
map("n", "N", "Nzzzv", { desc = "Prev search centered" })

-- Better paste (don't overwrite register)
map("x", "<leader>p", '"_dP', { desc = "Paste without yank" })

-- ============================================
-- QUICK ACTIONS
-- ============================================
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })
map("n", "<C-a>", "ggVG", { desc = "Select all" })
map("n", "<leader>cp", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  vim.notify("Copied: " .. path, vim.log.levels.INFO)
end, { desc = "Copy file path" })

-- Buffer navigation
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })

-- Quick formatting
map("n", "<leader>fm", function() require("conform").format() end, { desc = "Format buffer" })

-- ============================================
-- FOLDING (nvim-ufo)
-- ============================================
map("n", "zR", function() require("ufo").openAllFolds() end, { desc = "Open all folds" })
map("n", "zM", function() require("ufo").closeAllFolds() end, { desc = "Close all folds" })
map("n", "zK", function() require("ufo").peekFoldedLinesUnderCursor() end, { desc = "Peek fold" })

-- ============================================
-- TODO COMMENTS
-- ============================================
map("n", "]t", function() require("todo-comments").jump_next() end, { desc = "Next TODO" })
map("n", "[t", function() require("todo-comments").jump_prev() end, { desc = "Prev TODO" })
map("n", "<leader>td", "<cmd>TodoTelescope<cr>", { desc = "Todo Telescope" })

-- ============================================
-- TELESCOPE
-- ============================================
map("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "Find keymaps" })
