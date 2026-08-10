-- mason.nvim 2.x removed the `ensure_installed` setup option and NvChad no longer
-- ships `:MasonInstallAll`, so the list below is installed by M.install_missing().
local M = {}

M.ensure_installed = {
  -- markdown
  "marksman",
  -- lua
  "lua-language-server",
  "stylua",
  -- web dev
  "css-lsp",
  "html-lsp",
  "json-lsp",
  "typescript-language-server",
  -- c/c++
  "clangd",
  -- docker
  "dockerfile-language-server",
  "docker-compose-language-service",
  -- rust
  "rust-analyzer",
  "codelldb",
  -- go
  "gopls",
  "goimports",
  "goimports-reviser",
  "golangci-lint",
  "golangci-lint-langserver",
  "golines",
  -- python
  "pyright",
  "black",
  "mypy",
  "pylint",
  -- yaml/terraform
  "terraform-ls",
  "tflint",
  "yaml-language-server",
  "yamlfmt",
  "yamllint",
  -- sql
  "sqlfluff",
  "sqls",
  -- web development (vue, tailwind, eslint, emmet)
  "vue-language-server",
  "tailwindcss-language-server",
  "eslint-lsp",
  "emmet-ls",
  "prettier",
  -- kubernetes
  "helm-ls",
  -- shell
  "shfmt",
  -- vim
  "vim-language-server",
  -- treesitter parser compilation
  "tree-sitter-cli",
}

-- Deliberately not managed by mason:
--   rustfmt               -- not in the mason registry; comes with rustup
--   gofmt, terraform fmt  -- ship with the go / terraform toolchains
--   cmake-language-server -- no published release supports python >= 3.14

-- Install everything in M.ensure_installed that is not present yet.
-- Only refreshes the registry when something is actually missing, so the common
-- case (all installed) costs no network round-trip at startup.
function M.install_missing(opts)
  opts = opts or {}
  local registry = require "mason-registry"

  local function collect_missing()
    local missing, unknown = {}, {}
    for _, name in ipairs(M.ensure_installed) do
      local ok, pkg = pcall(registry.get_package, name)
      if not ok then
        table.insert(unknown, name)
      elseif not pkg:is_installed() then
        table.insert(missing, pkg)
      end
    end
    return missing, unknown
  end

  local function install(packages)
    vim.notify(("mason: installing %d package(s)"):format(#packages))
    for _, pkg in ipairs(packages) do
      pkg:install():once(
        "closed",
        vim.schedule_wrap(function()
          if pkg:is_installed() then
            vim.notify("mason: installed " .. pkg.name)
          else
            vim.notify("mason: failed to install " .. pkg.name, vim.log.levels.ERROR)
          end
        end)
      )
    end
  end

  local missing, unknown = collect_missing()

  for _, name in ipairs(unknown) do
    vim.notify("mason: unknown package " .. name, vim.log.levels.WARN)
  end

  if #missing == 0 then
    if opts.notify then
      vim.notify "mason: all packages already installed"
    end
    return
  end

  -- Something is missing: refresh first so we resolve current versions.
  registry.refresh(vim.schedule_wrap(function()
    install((collect_missing()))
  end))
end

return M
