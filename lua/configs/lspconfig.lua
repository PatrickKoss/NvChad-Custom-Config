require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "cssls",
  "ts_ls",
  "clangd",
  "rust_analyzer",
  "gopls",
  "pyright",
  "yamlls",
  "dockerls",
  "clojure_lsp",
  "cmake",
  "terraformls",
  "vimls",
}

vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
