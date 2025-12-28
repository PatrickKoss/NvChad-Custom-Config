require "nvchad.mappings"

local map = vim.keymap.set

-- Your custom mappings
map("n", ";", ":", { desc = "CMD enter command mode", nowait = true })
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })
map("n", "<leader>bd", "<cmd>bd<CR>", { desc = "Close buffer" })
map("n", "<leader>x", "<cmd>bd<CR>", { desc = "Close buffer" })
map("n", "<leader>ba", "<cmd>%bd|e#<cr>", { desc = "Close all but current" })
map("n", "<leader>bx", "<cmd>bp|bd#<cr>", { desc = "Close buffer keep window" })

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

-- Visual mode search and replace
map("v", "//", 'y/<C-R>"<CR>', { desc = "Search selected text" })
map("v", "<leader>r", '"hy:%s/<C-r>h//gc<left><left><left>', { desc = "Replace selection" })

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
-- GIT CONFLICT RESOLUTION
-- ============================================
map("n", "<leader>co", "<cmd>GitConflictChooseOurs<cr>", { desc = "Choose Ours (current)" })
map("n", "<leader>ct", "<cmd>GitConflictChooseTheirs<cr>", { desc = "Choose Theirs (incoming)" })
map("n", "<leader>cb", "<cmd>GitConflictChooseBoth<cr>", { desc = "Choose Both" })
map("n", "<leader>cn", "<cmd>GitConflictChooseNone<cr>", { desc = "Choose None" })
map("n", "[x", "<cmd>GitConflictPrevConflict<cr>", { desc = "Prev Conflict" })
map("n", "]x", "<cmd>GitConflictNextConflict<cr>", { desc = "Next Conflict" })
map("n", "<leader>cq", "<cmd>GitConflictListQf<cr>", { desc = "List Conflicts" })

-- ============================================
-- QUICKFIX & LOCATION LIST
-- ============================================
map("n", "]q", "<cmd>cnext<cr>", { desc = "Next quickfix" })
map("n", "[q", "<cmd>cprev<cr>", { desc = "Prev quickfix" })
map("n", "]Q", "<cmd>clast<cr>", { desc = "Last quickfix" })
map("n", "[Q", "<cmd>cfirst<cr>", { desc = "First quickfix" })
map("n", "<leader>qc", "<cmd>cclose<cr>", { desc = "Close quickfix" })
map("n", "<leader>qo", "<cmd>copen<cr>", { desc = "Open quickfix" })

map("n", "]l", "<cmd>lnext<cr>", { desc = "Next location" })
map("n", "[l", "<cmd>lprev<cr>", { desc = "Prev location" })

-- ============================================
-- DIAGNOSTICS
-- ============================================
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev diagnostic" })
map("n", "<leader>de", vim.diagnostic.open_float, { desc = "Show diagnostic" })

-- ============================================
-- FILE EXPLORER (nvim-tree)
-- ============================================
map("n", "<C-n>", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle file explorer" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<cr>", { desc = "Focus file explorer" })

-- ============================================
-- TELESCOPE
-- ============================================
map("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "Find keymaps" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
map("n", "<leader>fr", "<cmd>Telescope resume<cr>", { desc = "Resume last picker" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>", { desc = "Recent files" })
map("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "Document symbols" })
map("n", "<leader>fS", "<cmd>Telescope lsp_workspace_symbols<cr>", { desc = "Workspace symbols" })
map("n", "<leader>/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Fuzzy find in buffer" })
map("n", "<leader>fd", function()
  require("telescope.builtin").find_files({
    prompt_title = "Find Files (from dir)",
    cwd = vim.fn.input("Directory: ", vim.fn.getcwd() .. "/", "dir"),
  })
end, { desc = "Find files from directory" })
