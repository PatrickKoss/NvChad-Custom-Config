local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "black" },
    -- Go: imports + formatting + line length
    go = { "goimports-reviser", "gofmt", "golines" },
    -- Rust
    rust = { "rustfmt" },
    -- YAML/JSON
    yaml = { "yamlfmt" },
    json = { "prettier" },
    jsonc = { "prettier" },
    -- Web development
    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    vue = { "prettier" },
    svelte = { "prettier" },
    css = { "prettier" },
    scss = { "prettier" },
    html = { "prettier" },
    markdown = { "prettier" },
    graphql = { "prettier" },
    -- Terraform
    terraform = { "terraform_fmt" },
    tf = { "terraform_fmt" },
    ["terraform-vars"] = { "terraform_fmt" },
    -- Shell
    sh = { "shfmt" },
    bash = { "shfmt" },
    -- SQL
    sql = { "sqlfluff" },
  },

  -- format_on_save = {
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return options
