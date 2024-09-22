---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "highlights"

M.ui = {
  theme = "palenight",
  theme_toggle = { "onedark", "one_light","palenight" },

  hl_override = highlights.override,
  hl_add = highlights.add,
  transparency = true,
    statusline =  {
    theme = 'vscode'
  }
}

-- M.plugins = "plugins"

-- check core.mappings for table structure
-- M.mappings = require "mappings"

return M
