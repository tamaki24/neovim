require('hlchunk').setup({
    chunk = {
        chars = {
            horizontal_line = "─",
            vertical_line = "│",
            left_top = "╭",
            left_bottom = "╰",
            right_arrow = "",
        },
        style = {
            { fg = "#ADE0EE" },
            { fg = "#c21f30" },
        },
        textobject = "",
        max_file_size = 1024 * 1024,
        error_sign = true,
    },
    indent = {
        chars = { "┊" },

        style = {
            "#4682B4",
        },
    },

    line_num = {
        enable = true,
        use_treesitter = false,
        style = "#465DAA",
    },

    blank = {
        enable = false,
    }
})
