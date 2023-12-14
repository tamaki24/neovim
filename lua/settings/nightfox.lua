local nightfox = require('nightfox')

nightfox.setup({
  options = {
   transparent = true,
    styles = {
      comments = "italic",
      keywords = "bold",
      types = "italic,bold",
    }
  },
})

-- nightfox.load()
vim.cmd("colorscheme nightfox")

