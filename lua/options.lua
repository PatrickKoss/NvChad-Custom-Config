require "nvchad.options"

local o = vim.opt

-- Your custom options
vim.o.spell = true
vim.o.termguicolors = true

-- Line numbers (must use vim.opt to override NvChad defaults)
o.number = true           -- Show absolute line number on current line
o.relativenumber = true   -- Show relative line numbers
o.cursorline = true       -- Highlight current line
o.signcolumn = "yes"      -- Always show sign column (for breakpoints, git, etc.)
o.numberwidth = 4         -- Width of line number column
