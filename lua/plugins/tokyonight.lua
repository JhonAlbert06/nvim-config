return {
  "folke/tokyonight.nvim",
  name = "tokyonight",
  lazy = false,
  priority = 998,
  config = function()
    vim.cmd[[colorscheme tokyonight-night]]
  end
}
