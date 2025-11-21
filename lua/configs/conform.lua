local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "black" },
    go = { "goimports", "golines" },
    rust = { "rustfmt" },
    yaml = { "yamlfmt" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },
  },

  -- format_on_save = {
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return options
