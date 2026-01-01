local formatters_by_ft = {
  php = { "pint" },
  blade = { "blade-formatter" },
  lua = { "stylua" },
  python = { "ruff" },
  cpp = { "clang_format" },
  c = { "clang_format" },
  go = { "gofumpt" },
  cs = { "csharpier" },
  yaml = { "yamlfmt" },
  css = { "prettier" },
  flow = { "prettier" },
  graphql = { "prettier" },
  html = { "prettier" },
  json = { "prettier" },
  javascriptreact = { "prettier" },
  javascript = { "prettier" },
  less = { "prettier" },
  markdown = { "prettier" },
  scss = { "prettier" },
  typescript = { "prettier" },
  typescriptreact = { "prettier" },
  vue = { "prettier" },
  sh = { "shfmt" },
  rust = { "rustfmt" },
}

---@type NvPluginSpec
return {
  -- NOTE: Formatting
  "stevearc/conform.nvim",
  event = {
    "BufReadPost",
    "BufNewFile",
  },
  opts = {
    formatters_by_ft = formatters_by_ft,
    formatters = {
      shfmt = {
        prepend_args = { "-i", "4", "-ci", "-bn", "-sr" },
      },
    },
  },
}
