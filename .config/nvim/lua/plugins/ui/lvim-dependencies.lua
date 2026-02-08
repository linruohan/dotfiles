return {
  "lvim-tech/lvim-dependencies",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("lvim-dependencies").setup({
      -- your configuration here
    })
  end,
}
