return {
  -- Telescope configuration (extends NvChad defaults)
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        path_display = { "smart" }, -- Show more directory context
        layout_config = {
          horizontal = {
            preview_width = 0.55,
          },
        },
      },
      pickers = {
        keymaps = {
          show_plug = false, -- Hide <Plug> mappings
          layout_strategy = "vertical",
          layout_config = {
            vertical = {
              width = 0.9,
              height = 0.9,
              preview_height = 0.4,
              mirror = true,
            },
          },
          sorting_strategy = "ascending",
        },
      },
    },
  },

  -- Telescope file browser
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension("file_browser")
    end,
    keys = {
      { "<leader>fb", "<cmd>Telescope file_browser<cr>", desc = "File browser" },
      { "<leader>fB", "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>", desc = "File browser (cwd)" },
    },
  },

  -- Conform for formatting
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },

  -- LSP config
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "javascript",
        "typescript",
        "c",
        "markdown",
        "markdown_inline",
        "python",
        "go",
        "gomod",
        "gosum",
        "gowork",
        "rust",
        "yaml",
        "terraform",
        "dockerfile",
        "json",
        "toml",
      },
      indent = {
        enable = true,
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    },
  },

  -- Mason
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- markdown
        "marksman",
        -- lua
        "lua-language-server",
        "stylua",
        -- web dev
        "css-lsp",
        "html-lsp",
        "typescript-language-server",
        -- docker
        "dockerfile-language-server",
        "docker-compose-language-service",
        -- rust
        "rust-analyzer",
        "rustfmt",
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
      },
    },
  },

  -- Nvim-tree with git
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = {
        enable = true,
      },
      renderer = {
        highlight_git = true,
        icons = {
          show = {
            git = true,
          },
        },
      },
    },
  },

  -- Better escape
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- Copilot
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        panel = {
          enabled = true,
          auto_refresh = true,
          keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<M-CR>",
          },
          layout = {
            position = "bottom",
            ratio = 0.4,
          },
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = "<Tab>",
            accept_word = false,
            accept_line = false,
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
        filetypes = {
          yaml = false,
          markdown = false,
          help = false,
          gitcommit = false,
          gitrebase = false,
          ["."] = false,
        },
        copilot_node_command = "node",
      })
    end,
  },

  -- Autoclose
  {
    "m4xshen/autoclose.nvim",
    event = "InsertEnter",
    config = function()
      require("autoclose").setup()
    end,
  },

  -- Rainbow delimiters (brackets)
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "BufRead",
    config = function()
      local rainbow_delimiters = require "rainbow-delimiters"
      vim.g.rainbow_delimiters = {
        strategy = {
          [""] = rainbow_delimiters.strategy["global"],
          vim = rainbow_delimiters.strategy["local"],
        },
        query = {
          [""] = "rainbow-delimiters",
          lua = "rainbow-blocks",
        },
        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
      }
    end,
  },

  -- Indent blankline (rainbow indents)
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    main = "ibl",
    config = function()
      local highlight = {
        "RainbowRed",
        "RainbowYellow",
        "RainbowBlue",
        "RainbowOrange",
        "RainbowGreen",
        "RainbowViolet",
        "RainbowCyan",
      }

      local hooks = require "ibl.hooks"
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
        vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
        vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
      end)

      require("ibl").setup {
        indent = {
          highlight = highlight,
          char = "│",
        },
        scope = {
          enabled = true,
          show_start = true,
          show_end = false,
        },
        exclude = {
          filetypes = { "help", "dashboard", "NvimTree", "lazy", "mason" },
        },
      }
    end,
  },

  -- ============================================
  -- VISUAL ENHANCEMENTS
  -- ============================================

  -- Noice - Fancy command line & notifications
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        lsp_doc_border = true,
      },
    },
  },

  -- Todo-comments - Highlight TODO/FIXME/HACK
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },

  -- nvim-ufo - Modern folding with preview
  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    event = "BufRead",
    opts = {
      provider_selector = function()
        return { "treesitter", "indent" }
      end,
    },
    init = function()
      vim.o.foldcolumn = "1"
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
    end,
  },

  -- ============================================
  -- PRODUCTIVITY PLUGINS
  -- ============================================

  -- Flash - Insanely fast navigation
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    },
  },

  -- Trouble - Diagnostics list
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    opts = {},
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics" },
      { "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics" },
      { "<leader>xl", "<cmd>Trouble lsp toggle<cr>", desc = "LSP References" },
    },
  },

  -- Harpoon - Quick file switching
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("harpoon"):setup()
    end,
    keys = {
      { "<leader>ha", function() require("harpoon"):list():add() end, desc = "Harpoon add" },
      { "<leader>hm", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = "Harpoon menu" },
      { "<leader>h1", function() require("harpoon"):list():select(1) end, desc = "Harpoon 1" },
      { "<leader>h2", function() require("harpoon"):list():select(2) end, desc = "Harpoon 2" },
      { "<leader>h3", function() require("harpoon"):list():select(3) end, desc = "Harpoon 3" },
      { "<leader>h4", function() require("harpoon"):list():select(4) end, desc = "Harpoon 4" },
    },
  },

  -- Diffview - Git diff viewer
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Git Diff" },
      { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "File History" },
      { "<leader>gc", "<cmd>DiffviewClose<cr>", desc = "Close Diffview" },
    },
  },

  -- Spectre - Project-wide search & replace
  {
    "nvim-pack/nvim-spectre",
    cmd = "Spectre",
    keys = {
      { "<leader>sr", function() require("spectre").open() end, desc = "Search & Replace" },
      { "<leader>sw", function() require("spectre").open_visual({ select_word = true }) end, desc = "Search word" },
    },
  },

  -- Oil.nvim - Buffer-based file navigation
  {
    "stevearc/oil.nvim",
    config = function()
      require("oil").setup({
        delete_to_trash = true,
        skip_confirm_for_simple_edits = true,
        view_options = {
          show_hidden = true,
        },
      })
    end,
    keys = {
      { "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
      { "<leader>-", function() require("oil").open_float() end, desc = "Open parent directory (float)" },
    },
  },

  -- Symbols-outline - Code outline sidebar
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = {
      { "<leader>so", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" },
    },
    opts = {
      highlight_hovered_item = true,
      show_guides = true,
    },
  },

  -- ============================================
  -- AI ASSISTANTS
  -- ============================================

  -- Claude Code - AI coding assistant
  {
    "greggh/claude-code.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("claude-code").setup({
        window = {
          position = "vertical",
          split_ratio = 0.3,
        },
      })
    end,
    keys = {
      { "<leader>cc", "<cmd>ClaudeCode<cr>", desc = "Claude Code" },
      { "<leader>cC", "<cmd>ClaudeCodeResume<cr>", desc = "Claude Code Resume" },
    },
  },

  -- ============================================
  -- DEBUGGING (DAP)
  -- ============================================

  -- nvim-dap - Debug Adapter Protocol client
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      -- UI for nvim-dap
      {
        "rcarriga/nvim-dap-ui",
        dependencies = { "nvim-neotest/nvim-nio" },
        config = function()
          local dap, dapui = require("dap"), require("dapui")
          dapui.setup({
            icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
            mappings = {
              expand = { "<CR>", "<2-LeftMouse>" },
              open = "o",
              remove = "d",
              edit = "e",
              repl = "r",
              toggle = "t",
            },
            layouts = {
              {
                elements = {
                  { id = "scopes", size = 0.25 },
                  { id = "breakpoints", size = 0.25 },
                  { id = "stacks", size = 0.25 },
                  { id = "watches", size = 0.25 },
                },
                size = 40,
                position = "left",
              },
              {
                elements = {
                  { id = "repl", size = 0.5 },
                  { id = "console", size = 0.5 },
                },
                size = 10,
                position = "bottom",
              },
            },
          })
          -- Auto open/close UI
          dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
          dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
          dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
        end,
      },
      -- Virtual text for variables
      {
        "theHamsta/nvim-dap-virtual-text",
        opts = {
          enabled = true,
          enabled_commands = true,
          highlight_changed_variables = true,
          highlight_new_as_changed = false,
          show_stop_reason = true,
          commented = false,
        },
      },
      -- Mason DAP integration
      {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = "williamboman/mason.nvim",
        opts = {
          ensure_installed = { "delve", "debugpy", "js-debug-adapter" },
          handlers = {},
        },
      },
    },
    config = function()
      local dap = require("dap")

      -- Breakpoint signs
      vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
      vim.fn.sign_define("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
      vim.fn.sign_define("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })
      vim.fn.sign_define("DapStopped", { text = "▶", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" })
      vim.fn.sign_define("DapBreakpointRejected", { text = "○", texthl = "DapBreakpointRejected", linehl = "", numhl = "" })

      -- Highlight groups for breakpoints
      vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#E06C75" })
      vim.api.nvim_set_hl(0, "DapBreakpointCondition", { fg = "#E5C07B" })
      vim.api.nvim_set_hl(0, "DapLogPoint", { fg = "#61AFEF" })
      vim.api.nvim_set_hl(0, "DapStopped", { fg = "#98C379", bg = "#31353f" })
      vim.api.nvim_set_hl(0, "DapBreakpointRejected", { fg = "#ABB2BF" })

      -- =====================
      -- Go (Delve)
      -- =====================
      dap.adapters.delve = {
        type = "server",
        port = "${port}",
        executable = {
          command = "dlv",
          args = { "dap", "-l", "127.0.0.1:${port}" },
        },
      }
      dap.configurations.go = {
        {
          type = "delve",
          name = "Debug",
          request = "launch",
          program = "${file}",
        },
        {
          type = "delve",
          name = "Debug Package",
          request = "launch",
          program = "${fileDirname}",
        },
        {
          type = "delve",
          name = "Debug test",
          request = "launch",
          mode = "test",
          program = "${file}",
        },
        {
          type = "delve",
          name = "Debug test (go.mod)",
          request = "launch",
          mode = "test",
          program = "./${relativeFileDirname}",
        },
      }

      -- =====================
      -- Python (debugpy)
      -- =====================
      dap.adapters.python = {
        type = "executable",
        command = "python",
        args = { "-m", "debugpy.adapter" },
      }
      dap.configurations.python = {
        {
          type = "python",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          pythonPath = function()
            local venv = os.getenv("VIRTUAL_ENV")
            if venv then
              return venv .. "/bin/python"
            end
            return "python"
          end,
        },
        {
          type = "python",
          request = "launch",
          name = "Launch file with args",
          program = "${file}",
          args = function()
            local args_string = vim.fn.input("Arguments: ")
            return vim.split(args_string, " ")
          end,
          pythonPath = function()
            local venv = os.getenv("VIRTUAL_ENV")
            if venv then
              return venv .. "/bin/python"
            end
            return "python"
          end,
        },
      }

      -- =====================
      -- JavaScript/TypeScript (Node)
      -- =====================
      dap.adapters["pwa-node"] = {
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = {
          command = "node",
          args = {
            vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
            "${port}",
          },
        },
      }
      dap.configurations.javascript = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          cwd = "${workspaceFolder}",
        },
      }
      dap.configurations.typescript = dap.configurations.javascript

      -- =====================
      -- Rust (codelldb)
      -- =====================
      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/adapter/codelldb",
          args = { "--port", "${port}" },
        },
      }
      dap.configurations.rust = {
        {
          name = "Launch",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
      }
    end,
    keys = {
      { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
      { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, desc = "Conditional Breakpoint" },
      { "<leader>dl", function() require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end, desc = "Log Point" },
      { "<leader>dc", function() require("dap").continue() end, desc = "Continue" },
      { "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
      { "<leader>do", function() require("dap").step_over() end, desc = "Step Over" },
      { "<leader>dO", function() require("dap").step_out() end, desc = "Step Out" },
      { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
      { "<leader>ds", function() require("dap").session() end, desc = "Session" },
      { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
      { "<leader>du", function() require("dapui").toggle() end, desc = "Toggle DAP UI" },
      { "<leader>de", function() require("dapui").eval() end, desc = "Eval", mode = { "n", "v" } },
      { "<F5>", function() require("dap").continue() end, desc = "Debug: Continue" },
      { "<F10>", function() require("dap").step_over() end, desc = "Debug: Step Over" },
      { "<F11>", function() require("dap").step_into() end, desc = "Debug: Step Into" },
      { "<F12>", function() require("dap").step_out() end, desc = "Debug: Step Out" },
    },
  },
}
