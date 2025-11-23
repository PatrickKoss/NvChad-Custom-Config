# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal Neovim configuration based on NvChad v2.5. Uses lazy.nvim for plugin management with NvChad as the base framework.

## Common Commands

```bash
# Start Neovim (plugins auto-install on first run)
nvim

# Update plugins (inside Neovim)
:Lazy update

# Update treesitter parsers
:TSUpdate

# Install LSP/tools via Mason
:MasonInstall <server-name>

# Clean reinstall (if issues occur)
rm -rf ~/.local/share/nvim/lazy ~/.local/share/nvim/base46 ~/.local/state/nvim ~/.cache/nvim && nvim
```

## Architecture

```
init.lua                    # Entry point: bootstraps lazy.nvim, loads NvChad + plugins
lua/
├── chadrc.lua              # NvChad config: theme (oceanic-next), statusline, semantic token colors
├── options.lua             # Vim options
├── mappings.lua            # Custom keymaps (leader = Space)
├── autocmds.lua            # Autocommands + semantic highlighting setup
├── configs/
│   ├── lazy.lua            # Lazy.nvim settings
│   ├── lspconfig.lua       # LSP server config (gopls, pyright, rust_analyzer, etc.)
│   └── conform.lua         # Formatter config (black, goimports, rustfmt, stylua, prettier)
└── plugins/
    └── init.lua            # All plugin specs with configs
```

## Key Design Decisions

- **Semantic tokens enabled** (unlike NvChad default) via custom LspAttach in `configs/lspconfig.lua`
- **IntelliJ-like syntax colors** defined in `chadrc.lua` hl_override section
- **gopls has enhanced settings** for semantic tokens, hints, and static analysis
- **LSP uses Neovim 0.11+ native API**: `vim.lsp.config()` and `vim.lsp.enable()`

## Adding/Modifying Configuration

**New plugin**: Add spec to `lua/plugins/init.lua`, restart or `:Lazy sync`

**New LSP server**:
1. `:MasonInstall <server-name>`
2. Add to servers list in `lua/configs/lspconfig.lua`
3. Call `vim.lsp.enable("<server-name>")`

**Custom keymaps**: Edit `lua/mappings.lua`

**Theme/colors**: Edit `lua/chadrc.lua` (theme in `M.base46`, highlights in `hl_override`)

## Requirements

- Neovim >= 0.11
- Node.js (for Copilot, some LSP servers)
- ripgrep (for Telescope)
- C compiler (for treesitter parsers)
