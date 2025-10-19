require("config.lazy")

vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

vim.keymap.set("n", "<leader>d", "yyp", { noremap = true, silent = true })
vim.keymap.set("n", "<c-q>", ":qa<cr>", { noremap = true, silent = true })

vim.keymap.set("n", "<F2>", ":wa<cr>", { noremap = true, silent = true })
vim.keymap.set("i", "<F2>", "<Esc>:wa<cr>", { noremap = true, silent = true })

vim.keymap.set("n", "<F3>", ":NvimTreeToggle<cr>", { noremap = true, silent = true })

vim.keymap.set("n", "<c-j>", ":FzfLua files<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<c-k>", ":FzfLua buffers<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<c-n>", ":FzfLua blines<cr>", { noremap = true, silent = true })
