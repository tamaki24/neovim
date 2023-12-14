---@diagnostic disable: undefined-global
local keymap = vim.keymap
local opts = {noremap = true, silent = true }

keymap.set("n", "x", '"_x')

-- Increment/Decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- New tab
keymap.set("n", "te", ":tabedit")
keymap.set("n", "tn", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)
-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- SelectAll
keymap.set("n", "all", "gg<S-v>G")

-- Terminal
keymap.set("n", "<Leader>ft", "<Cmd>FloatermNew<CR>", { silent = true })

-- Buf移動
keymap.set("n", "<tab>", "<Cmd>bnext<CR>", { silent = true })

-- エラーメッセージ
keymap.set("n", "<Leader>e", vim.diagnostic.open_float, {silent = true});
