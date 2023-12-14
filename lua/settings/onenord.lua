
local colors = require('onenord.colors').load()

require('onenord').setup {
  styles = {
    comments = 'NONE',
    strings = 'NONE',
    keywords = 'bold',
    functions = 'bold',
    variables = 'NONE',
    diagnostics = 'underline',
  },

  disable = {
    background = true,
    float_background = true,
  },

  custom_highlights = {
    MatchParen = { fg = colors.none, bg = colors.none, style = 'bold,underline' },
  },
  custom_colors = {
    mypink = '#fff',
  },
}
