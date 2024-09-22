local options = {
  lsp_fallback = true,
  formatters_by_ft = {
    lua = { "stylua" },
svelte = { "svelte_fmt" }, -- custom

    -- javascript = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },
    python = { "isort", "black" },
    javascript = { { "prettierd", "prettier" } },
    sh = { "shfmt" },
    markdown = { "prettierd", "injected" },
    c = { "clang_format" },
    cpp = { "clang_format" },
    objc = { "clang_format" },
    objcpp = { "clang_format" },
    cuda = { "clang_format" },
    proto = { "clang_format" },
           -- webdev
    javascript = { "biome" },
    javascriptreact = { "biome" },
    typescript = { "biome" },
    typescriptreact = { "biome" },

    css = { "biome" },
    html = { "biome" },
    json = { "biome" },
    jsonc = { "biome" },

    markdown = { "deno_fmt" },
    sh = { "shfmt" },
    yaml = { "yamlfmt" },
  },

  -- adding same formatter for multiple filetypes can look too much work for some
  -- instead of the above code you could just use a loop! the config is just a table after all!

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
  formatters = {
    shfmt = {
      prepend_args = { "-i", "4", "-ci", "-bn", "-sr" },
    },
    svelte_fmt = {
      command = "prettier",
      args = { "--plugin", prettier_svelte, "$FILENAME" },
    },
  },
  init = function()
    -- If you want the formatexpr, here is the place to set it
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}

require("conform").setup(options)
