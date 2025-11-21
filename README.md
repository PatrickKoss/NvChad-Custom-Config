# Neovim Config

Personal Neovim configuration based on [NvChad v2.5](https://github.com/NvChad/NvChad).

## Installation

```bash
git clone https://github.com/PatrickKoss/nvim-config ~/.config/nvim && nvim
```

First run will automatically install all plugins via lazy.nvim.

## Structure

```
~/.config/nvim/
├── init.lua                 # Entry point, lazy.nvim bootstrap
└── lua/
    ├── chadrc.lua           # NvChad UI/theme config
    ├── mappings.lua         # Custom keymaps
    ├── options.lua          # Vim options
    ├── autocmds.lua         # Autocommands
    ├── configs/
    │   ├── conform.lua      # Formatter configuration
    │   ├── lazy.lua         # Lazy.nvim settings
    │   └── lspconfig.lua    # LSP server configuration
    └── plugins/
        └── init.lua         # Plugin specifications
```

## Features

- **Theme**: oceanic-next (with one_light toggle)
- **LSP**: gopls, pyright, rust_analyzer, terraformls, yamlls, dockerls, ts_ls, and more
- **Formatters**: black, golines, goimports, rustfmt, stylua, prettier, yamlfmt
- **Plugins**: copilot.lua, better-escape, autoclose, rainbow-delimiters

## Custom Keymaps

| Key | Mode | Action |
|-----|------|--------|
| `;` | n | Enter command mode |
| `jk` | i | Escape |
| `<C-w>` | n | Close buffer |
| `<leader>gg` | n | Run golines |
| `<leader>bb` | n | Run black |

## Requirements

- Neovim >= 0.10
- Git
- Node.js (for copilot, LSP servers)
- ripgrep (for telescope)
