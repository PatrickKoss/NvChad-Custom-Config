-- Load NvChad's LSP theme and diagnostic config
dofile(vim.g.base46_cache .. "lsp")
require("nvchad.lsp").diagnostic_config()

-- Setup keymaps on LspAttach (from NvChad but without disabling semantic tokens)
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    local function opts(desc)
      return { buffer = bufnr, desc = "LSP " .. desc }
    end

    local map = vim.keymap.set
    map("n", "gD", vim.lsp.buf.declaration, opts "Go to declaration")
    map("n", "gd", vim.lsp.buf.definition, opts "Go to definition")
    map("n", "gi", vim.lsp.buf.implementation, opts "Go to implementation")
    map("n", "gr", vim.lsp.buf.references, opts "Show references")
    map("n", "K", vim.lsp.buf.hover, opts "Hover documentation")
    map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts "Add workspace folder")
    map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts "Remove workspace folder")
    map("n", "<leader>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts "List workspace folders")
    map("n", "<leader>D", vim.lsp.buf.type_definition, opts "Go to type definition")
    map("n", "<leader>ra", vim.lsp.buf.rename, opts "Rename")
    map("n", "<leader>ca", vim.lsp.buf.code_action, opts "Code action")
    map("i", "<C-k>", vim.lsp.buf.signature_help, opts "Signature help")

    -- Enable semantic tokens if supported (NOT disabled like NvChad default)
    if client and client.server_capabilities.semanticTokensProvider then
      vim.lsp.semantic_tokens.start(bufnr, args.data.client_id)
    end
  end,
})

-- Basic servers
local servers = {
  "html",
  "cssls",
  "ts_ls",
  "clangd",
  "rust_analyzer",
  "pyright",
  "yamlls",
  "jsonls",
  "dockerls",
  "cmake",
  "terraformls",
  "vimls",
}

vim.lsp.enable(servers)

-- Gopls with enhanced settings for semantic tokens
vim.lsp.config("gopls", {
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
        shadow = true,
        unusedwrite = true,
        useany = true,
      },
      staticcheck = true,
      gofumpt = true,
      usePlaceholders = true,
      completeUnimported = true,
      semanticTokens = true,
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
    },
  },
})
vim.lsp.enable("gopls")
