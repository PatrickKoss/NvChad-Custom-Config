require "nvchad.autocmds"

local autocmd = vim.api.nvim_create_autocmd

-- Helper function to set all semantic highlights
local function setup_semantic_highlights()
  local hl = vim.api.nvim_set_hl

  -- Imported packages (namespace) - Purple/Magenta like IntelliJ
  hl(0, "@lsp.type.namespace", { fg = "#C678DD" })
  hl(0, "@lsp.type.namespace.go", { fg = "#C678DD" })

  -- Types, structs, classes - Yellow
  hl(0, "@lsp.type.type", { fg = "#E5C07B" })
  hl(0, "@lsp.type.struct", { fg = "#E5C07B" })
  hl(0, "@lsp.type.class", { fg = "#E5C07B" })
  hl(0, "@lsp.type.type.go", { fg = "#E5C07B" })
  hl(0, "@lsp.type.struct.go", { fg = "#E5C07B" })

  -- Interfaces - Cyan
  hl(0, "@lsp.type.interface", { fg = "#56B6C2" })
  hl(0, "@lsp.type.interface.go", { fg = "#56B6C2" })

  -- Enums
  hl(0, "@lsp.type.enum", { fg = "#E5C07B" })
  hl(0, "@lsp.type.enumMember", { fg = "#D19A66" })

  -- Functions and methods - Blue
  hl(0, "@lsp.type.function", { fg = "#61AFEF" })
  hl(0, "@lsp.type.method", { fg = "#61AFEF" })
  hl(0, "@lsp.type.function.go", { fg = "#61AFEF" })
  hl(0, "@lsp.type.method.go", { fg = "#61AFEF" })

  -- Parameters - Red with italic
  hl(0, "@lsp.type.parameter", { fg = "#E06C75", italic = true })
  hl(0, "@lsp.type.parameter.go", { fg = "#E06C75", italic = true })

  -- Variables
  hl(0, "@lsp.type.variable", { fg = "#ABB2BF" })
  hl(0, "@lsp.type.variable.go", { fg = "#ABB2BF" })

  -- Properties/fields - Red
  hl(0, "@lsp.type.property", { fg = "#E06C75" })
  hl(0, "@lsp.type.property.go", { fg = "#E06C75" })

  -- Type parameters
  hl(0, "@lsp.type.typeParameter", { fg = "#E5C07B", italic = true })
  hl(0, "@lsp.type.typeParameter.go", { fg = "#E5C07B", italic = true })

  -- Modifiers
  hl(0, "@lsp.mod.readonly", { italic = true })
  hl(0, "@lsp.mod.defaultLibrary", { fg = "#56B6C2" })
  hl(0, "@lsp.mod.deprecated", { strikethrough = true })

  -- Treesitter highlights for Go
  hl(0, "@module.go", { fg = "#C678DD" })           -- package names
  hl(0, "@function.call.go", { fg = "#61AFEF" })    -- function calls
  hl(0, "@method.call.go", { fg = "#61AFEF" })      -- method calls
  hl(0, "@type.go", { fg = "#E5C07B" })             -- types
  hl(0, "@constant.go", { fg = "#D19A66" })         -- constants
  hl(0, "@field.go", { fg = "#E06C75" })            -- struct fields

  -- General treesitter highlights
  hl(0, "@module", { fg = "#C678DD" })
  hl(0, "@namespace", { fg = "#C678DD" })
  hl(0, "@function.call", { fg = "#61AFEF" })
  hl(0, "@method.call", { fg = "#61AFEF" })
end

-- Setup semantic token highlights (IntelliJ-like coloring)
autocmd("ColorScheme", {
  callback = setup_semantic_highlights,
})

-- Apply highlights on startup
setup_semantic_highlights()
