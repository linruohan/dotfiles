local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = {
  "html",
  "cssls",
    "jsonls", "unocss", "emmet_language_server", "svelte", "yamlls",
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
  "bashls",
  "marksman",
  "clangd",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
-- typescript
-- require("typescript-tools").setup {
  -- on_attach = on_attach,
  -- capabilities = capabilities,
-- }
--
-- lspconfig.pyright.setup { blabla}
