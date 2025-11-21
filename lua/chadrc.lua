-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "oceanic-next",
  theme_toggle = { "oceanic-next", "one_light" },
  transparency = false,

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },

    -- Imported packages/namespaces - Purple (IntelliJ-like)
    ["@lsp.type.namespace"] = { fg = "#C678DD" },
    ["@namespace"] = { fg = "#C678DD" },
    ["@module"] = { fg = "#C678DD" },

    -- Types, structs, classes - Yellow
    ["@lsp.type.type"] = { fg = "#E5C07B" },
    ["@lsp.type.struct"] = { fg = "#E5C07B" },
    ["@lsp.type.class"] = { fg = "#E5C07B" },
    ["@lsp.type.enum"] = { fg = "#E5C07B" },
    ["@lsp.type.typeParameter"] = { fg = "#E5C07B", italic = true },
    ["@type"] = { fg = "#E5C07B" },
    ["@type.builtin"] = { fg = "#56B6C2" },
    ["@constructor"] = { fg = "#E5C07B" },

    -- Interfaces - Cyan
    ["@lsp.type.interface"] = { fg = "#56B6C2" },

    -- Functions and methods - Blue
    ["@lsp.type.function"] = { fg = "#61AFEF" },
    ["@lsp.type.method"] = { fg = "#61AFEF" },
    ["@function"] = { fg = "#61AFEF" },
    ["@function.builtin"] = { fg = "#56B6C2" },
    ["@function.call"] = { fg = "#61AFEF" },
    ["@method"] = { fg = "#61AFEF" },
    ["@method.call"] = { fg = "#61AFEF" },

    -- Parameters - Red with italic
    ["@lsp.type.parameter"] = { fg = "#E06C75", italic = true },
    ["@parameter"] = { fg = "#E06C75", italic = true },

    -- Variables - Gray
    ["@lsp.type.variable"] = { fg = "#ABB2BF" },
    ["@variable"] = { fg = "#ABB2BF" },
    ["@variable.builtin"] = { fg = "#E06C75" },

    -- Properties/fields - Red
    ["@lsp.type.property"] = { fg = "#E06C75" },
    ["@field"] = { fg = "#E06C75" },
    ["@property"] = { fg = "#E06C75" },

    -- Constants - Orange
    ["@lsp.type.enumMember"] = { fg = "#D19A66" },
    ["@constant"] = { fg = "#D19A66" },
    ["@constant.builtin"] = { fg = "#D19A66" },

    -- Modifiers
    ["@lsp.mod.readonly"] = { italic = true },
    ["@lsp.mod.defaultLibrary"] = { fg = "#56B6C2" },
    ["@lsp.mod.deprecated"] = { strikethrough = true },
  },
}

M.ui = {
  statusline = {
    theme = "default",
  },
}

return M
