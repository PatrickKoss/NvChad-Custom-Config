require "nvchad.autocmds"

local autocmd = vim.api.nvim_create_autocmd

-- Setup semantic token highlights (IntelliJ-like coloring)
autocmd("ColorScheme", {
  callback = function()
    -- LSP Semantic token highlights
    vim.api.nvim_set_hl(0, "@lsp.type.namespace", { fg = "#ABB2BF" })
    vim.api.nvim_set_hl(0, "@lsp.type.type", { fg = "#E5C07B" })
    vim.api.nvim_set_hl(0, "@lsp.type.struct", { fg = "#E5C07B" })
    vim.api.nvim_set_hl(0, "@lsp.type.class", { fg = "#E5C07B" })
    vim.api.nvim_set_hl(0, "@lsp.type.interface", { fg = "#56B6C2" })
    vim.api.nvim_set_hl(0, "@lsp.type.enum", { fg = "#E5C07B" })
    vim.api.nvim_set_hl(0, "@lsp.type.enumMember", { fg = "#D19A66" })
    vim.api.nvim_set_hl(0, "@lsp.type.function", { fg = "#61AFEF" })
    vim.api.nvim_set_hl(0, "@lsp.type.method", { fg = "#61AFEF" })
    vim.api.nvim_set_hl(0, "@lsp.type.parameter", { fg = "#E06C75", italic = true })
    vim.api.nvim_set_hl(0, "@lsp.type.variable", { fg = "#ABB2BF" })
    vim.api.nvim_set_hl(0, "@lsp.type.property", { fg = "#E06C75" })
    vim.api.nvim_set_hl(0, "@lsp.type.typeParameter", { fg = "#E5C07B" })
    vim.api.nvim_set_hl(0, "@lsp.mod.readonly", { italic = true })
    vim.api.nvim_set_hl(0, "@lsp.mod.defaultLibrary", { fg = "#56B6C2" })

    -- Go-specific semantic tokens
    vim.api.nvim_set_hl(0, "@lsp.type.namespace.go", { fg = "#ABB2BF" })
    vim.api.nvim_set_hl(0, "@lsp.type.type.go", { fg = "#E5C07B" })
    vim.api.nvim_set_hl(0, "@lsp.type.struct.go", { fg = "#E5C07B" })
    vim.api.nvim_set_hl(0, "@lsp.type.interface.go", { fg = "#56B6C2" })
    vim.api.nvim_set_hl(0, "@lsp.type.function.go", { fg = "#61AFEF" })
    vim.api.nvim_set_hl(0, "@lsp.type.method.go", { fg = "#61AFEF" })
    vim.api.nvim_set_hl(0, "@lsp.type.parameter.go", { fg = "#E06C75", italic = true })
  end,
})

-- Apply highlights on startup
vim.api.nvim_set_hl(0, "@lsp.type.namespace", { fg = "#ABB2BF" })
vim.api.nvim_set_hl(0, "@lsp.type.type", { fg = "#E5C07B" })
vim.api.nvim_set_hl(0, "@lsp.type.struct", { fg = "#E5C07B" })
vim.api.nvim_set_hl(0, "@lsp.type.class", { fg = "#E5C07B" })
vim.api.nvim_set_hl(0, "@lsp.type.interface", { fg = "#56B6C2" })
vim.api.nvim_set_hl(0, "@lsp.type.function", { fg = "#61AFEF" })
vim.api.nvim_set_hl(0, "@lsp.type.method", { fg = "#61AFEF" })
vim.api.nvim_set_hl(0, "@lsp.type.parameter", { fg = "#E06C75", italic = true })
vim.api.nvim_set_hl(0, "@lsp.type.variable", { fg = "#ABB2BF" })
vim.api.nvim_set_hl(0, "@lsp.type.property", { fg = "#E06C75" })
