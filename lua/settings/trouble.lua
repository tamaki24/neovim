local trouble = require 'trouble'

trouble.setup {}
vim.keymap.set('n', 'fix', function() trouble.open() end)
