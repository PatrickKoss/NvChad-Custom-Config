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

    -- Semantic token highlights (IntelliJ-like colors)
    ["@lsp.type.namespace"] = { fg = "#ABB2BF" },        -- packages (gray)
    ["@lsp.type.type"] = { fg = "#E5C07B" },             -- types (yellow)
    ["@lsp.type.struct"] = { fg = "#E5C07B" },           -- structs (yellow)
    ["@lsp.type.class"] = { fg = "#E5C07B" },            -- classes (yellow)
    ["@lsp.type.interface"] = { fg = "#56B6C2" },        -- interfaces (cyan)
    ["@lsp.type.enum"] = { fg = "#E5C07B" },             -- enums (yellow)
    ["@lsp.type.enumMember"] = { fg = "#D19A66" },       -- enum members (orange)
    ["@lsp.type.function"] = { fg = "#61AFEF" },         -- functions (blue)
    ["@lsp.type.method"] = { fg = "#61AFEF" },           -- methods (blue)
    ["@lsp.type.parameter"] = { fg = "#E06C75" },        -- parameters (red)
    ["@lsp.type.variable"] = { fg = "#ABB2BF" },         -- variables (gray)
    ["@lsp.type.property"] = { fg = "#E06C75" },         -- properties (red)
    ["@lsp.type.typeParameter"] = { fg = "#E5C07B" },    -- type params (yellow)
    ["@lsp.mod.readonly"] = { italic = true },           -- readonly (italic)
    ["@lsp.mod.defaultLibrary"] = { fg = "#56B6C2" },    -- stdlib (cyan)

    -- Treesitter highlights
    ["@type"] = { fg = "#E5C07B" },
    ["@type.builtin"] = { fg = "#56B6C2" },
    ["@function"] = { fg = "#61AFEF" },
    ["@function.builtin"] = { fg = "#56B6C2" },
    ["@function.call"] = { fg = "#61AFEF" },
    ["@method"] = { fg = "#61AFEF" },
    ["@method.call"] = { fg = "#61AFEF" },
    ["@constructor"] = { fg = "#E5C07B" },
    ["@parameter"] = { fg = "#E06C75", italic = true },
    ["@variable"] = { fg = "#ABB2BF" },
    ["@variable.builtin"] = { fg = "#E06C75" },
    ["@field"] = { fg = "#E06C75" },
    ["@property"] = { fg = "#E06C75" },
    ["@constant"] = { fg = "#D19A66" },
    ["@constant.builtin"] = { fg = "#D19A66" },
    ["@namespace"] = { fg = "#ABB2BF" },
    ["@module"] = { fg = "#ABB2BF" },
  },
}

M.ui = {
  statusline = {
    theme = "default",
  },
}

return M
