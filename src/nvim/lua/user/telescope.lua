local builtin = require("telescope.builtin")
local actions = require("telescope.actions")

vim.keymap.set("n", "<Leader><space>", builtin.find_files, {})
vim.keymap.set("n", "<Leader>g", builtin.live_grep, {})
vim.keymap.set("n", "<Leader>a", builtin.buffers, {})
vim.keymap.set("n", "<Leader>h", builtin.help_tags, {})
