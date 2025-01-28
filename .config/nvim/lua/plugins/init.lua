local overrides = require("configs.overrides")
vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]
vim.o.spell = true

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options
{
    "hrsh7th/nvim-cmp",
    opts = overrides.cmp,

    dependencies = {
      {
        -- snippet plugin
        "L3MON4D3/LuaSnip",
        config = function(_, opts)
          require("luasnip").config.set_config(opts)

          local luasnip = require "luasnip"

          luasnip.filetype_extend("javascriptreact", { "html" })
          luasnip.filetype_extend("typescriptreact", { "html" })
          luasnip.filetype_extend("svelte", { "html" })

          require('nvchad.configs.luasnip')
        end,
      },

      -- ai based completion
      {
        "jcdickinson/codeium.nvim",
        config = function()
          require("codeium").setup {}
        end,
      },
    },
  },
    {
    "numToStr/Comment.nvim",
    dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
    config = function()
      require("Comment").setup {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
  },

    {
            "numToStr/Comment.nvim",
            dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
            config = function()
                  require("Comment").setup {
                pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
              }
                end,
          },
 -- dim inactive windows
  {
    "andreadev-it/shade.nvim",
    config = function()
      require("shade").setup {
        exclude_filetypes = { "NvimTree" },
      }
    end,
  },

  -- pretty diagnostics panel
  {
    "folke/trouble.nvim",
    cmd = { "Trouble", "TodoTrouble" },
    dependencies = {
      {
        "folke/todo-comments.nvim",
        opts = {},
      },
    },
    config = function()
      require("trouble").setup()
    end,
  },

  -- syntax support fgor yuck lang
  {
    "elkowar/yuck.vim",
    ft = "yuck",
  },

  {
    "gpanders/nvim-parinfer",
    event = "InsertEnter",
  },

  -- distraction free mode
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    config = function()
      require "configs.zenmode"
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = { extensions_list = { "fzf", "glyph" , 'terms'} },
    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "ghassan0/telescope-glyph.nvim" },
    },
  },

  {
    "mbbill/undotree",
    cmd = { "UndotreeToggle" },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "nvchad.configs.lspconfig"
      require "configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "stevearc/conform.nvim",
    --  for users those who want auto-save conform + lazyloading!
    -- event = "BufWritePre"
    config = function()
      require "configs.conform"
    end,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }

  {
    "williamboman/nvim-lsp-installer",
    event = "BufRead",
    config = function()
      local lsp_installer = require("nvim-lsp-installer")

        lsp_installer.on_server_ready(function(server)
        local opts = {}
        server:setup(opts)
        vim.cmd([[ do User LspAttachBuffers ]])
      end)
    end,
  },

  -- Rainbow indent plugin
  {"p00f/nvim-ts-rainbow",
    event = "BufRead",
    config = function()
      require("nvim-treesitter.configs").setup {
        rainbow = {
          enable = true,
          extended_mode = true,
          max_file_lines = nil,
        },
      }
    end,
  },

  -- -- Rainbow brackets plugin
  -- {"lukas-reineke/indent-blankline.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("indent_blankline").setup {
  --       use_treesitter = true,
  --       space_char_blankline = " ",
  --       show_current_context_start = true,
  --       char_highlight_list = {
  --         "IndentBlanklineIndent1",
  --         "IndentBlanklineIndent2",
  --         "IndentBlanklineIndent3",
  --         "IndentBlanklineIndent4",
  --         "IndentBlanklineIndent5",
  --         "IndentBlanklineIndent6",
  --       },
  --       show_current_context = true,
  --       filetype_exclude = { "help", "dashboard", "dashpreview", "NvimTree", "vista", "sagahover" },
  --       buftype_exclude = { "terminal", "nofile" },
  --       context_patterns = {
  --         "class",
  --         "function",
  --         "method",
  --         "block",
  --         "list_literal",
  --         "selector",
  --         "^if",
  --         "^table",
  --         "if_statement",
  --         "while",
  --         "for",
  --         "loop",
  --         "fn",
  --         "func",
  --       },
  --     }
  --   end,
  -- },
  --
  -- Copilot
  -- {"zbirenbaum/copilot.lua",
  --   cmd = "Copilot",
  --   event = {"InsertEnter", "BufEnter", "BufRead"},
  --   config = function()
  --     require("copilot").setup({
  --       panel = {
  --         enabled = true,
  --         auto_refresh = true,
  --         keymap = {
  --           jump_prev = "[[",
  --           jump_next = "]]",
  --           accept = "<CR>",
  --           refresh = "gr",
  --           open = "<M-CR>"
  --         },
  --         layout = {
  --           position = "bottom", -- | top | left | right
  --           ratio = 0.4
  --         },
  --       },
  --       suggestion = {
  --         enabled = true,
  --         auto_accept = true,
  --         auto_trigger = true,
  --         debounce = 75,
  --         keymap = {
  --           accept = "<Tab>",
  --           accept_word = false,
  --           accept_line = false,
  --           next = "<M-]>",
  --           prev = "<M-[>",
  --           dismiss = "<C-]>",
  --         },
  --       },
  --       filetypes = {
  --         yaml = false,
  --         markdown = false,
  --         help = false,
  --         gitcommit = false,
  --         gitrebase = false,
  --         hgcommit = false,
  --         svn = false,
  --         cvs = false,
  --         ["."] = false,
  --       },
  --       copilot_node_command = 'node', -- Node.js version must be > 16.x
  --       server_opts_overrides = {},
  --     })
  --   end,
  -- },
  {"m4xshen/autoclose.nvim",
    event = "BufEnter",
    config = function()
      require("autoclose").setup()
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
}
}

return plugins
