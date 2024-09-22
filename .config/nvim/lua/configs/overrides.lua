local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "json",
    "toml",
    "markdown",
    "bash",
    "lua",
    "tsx",
  },
    incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn", -- set to `false` to disable one of the mappings
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
      autotag = {
    enable = true,
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- markdown
    "marksman",
    "misspell",

    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    -- docker
    "dockerfile-language-server",
    "docker-compose-language-service",

    -- rust
    "rust-analyzer",
    "rustfmt",

    -- go
    "gopls",
    "glint",
    "go-debug-adapter",
    "goimports",
    "goimports-reviser",
    "golangci-lint",
    "golangci-lint-langserver",
    "golines",
    "gotests",
    "gotestsum",

    -- python
    "pyright",
    "flake8",
    "black",
    "mypy",
    "pydocstyle",
    "pylint",
    "pyre",
    "autoflake",
    "autopep8",
    "python-lsp-server",

    -- yaml
    "terraform-ls",
    "tflint",
    "yaml-language-server",
    "yamlfmt",
    "yamllint",

    -- sql
    "sqlfluff",
    "sqls",
    -- sh
    "shellcheck",
    "shfmt",
    "shellharden",
  },
}

-- git support in nvimtree
M.nvimtree = {
    view = {
    adaptive_size = true,
  },
  filters = {
    dotfiles = true,
    custom = { "node_modules" },
  },
  git = {
    enable = true,
        ignore=true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}
M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev
    "css-lsp",
    "html-lsp",
    -- "typescript-language-server",
    "deno",
    "prettier",
    "emmet-language-server",
    "json-lsp",
    -- "tailwindcss-language-server",
    "unocss-language-server",

    -- shell
    "shfmt",
    "shellcheck",
    "bash-language-server",

    -- "clangd",
    -- "clang-format",
  },
}

M.cmp = {
  sources = {
    -- trigger_characters is for unocss lsp
    { name = "codeium" },
    { name = "nvim_lsp", trigger_characters = { "-" } },
    { name = "path" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "nvim_lua" },
  },
  experimental = {
    ghost_text = true,
  },
}
return M
