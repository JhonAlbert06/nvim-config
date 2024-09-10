return {
  "olimorris/onedarkpro.nvim",
  name = "OneDarkPro", 
  lazy = false,
  priority = 1000,
  config = function()
    require('onedarkpro').setup({
      options = {
        transparency = true,
      }
    })
    vim.cmd("colorscheme onedark_dark")
  end
}
