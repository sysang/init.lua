require("config.lazy")

vim.g.mapleader = ' '
vim.g.python3_host_prog = '/usr/bin/python3'

vim.opt.mouse = ''
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.wrap = false
vim.opt.shiftround = true
vim.opt.termguicolors = true
vim.opt.ff = "unix"
vim.opt.updatetime = 60000
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 3
vim.opt.iskeyword:append("-")

vim.opt.grepprg = "rg --ignore-file=.gitignore --vimgrep"

vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

vim.keymap.set("n", "<leader>d", "yyp", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>o", "o<Esc>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>O", "O<Esc>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>j", "7j", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>k", "7k", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>h", "7h", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>l", "7l", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>n", ":noh<cr>", { noremap = true, silent = true })

vim.keymap.set("n", "<c-q>", ":qa<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-k>", "k<S-j>", { noremap = true, silent = true })

vim.keymap.set("n", "<F2>", ":wa<cr>", { noremap = true, silent = true })
vim.keymap.set("i", "<F2>", "<Esc>:wa<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<F3>", ":NvimTreeToggle<cr>", { noremap = true, silent = true })

vim.keymap.set("n", "gO", "<nop>", { noremap = true, silent = true })
vim.keymap.set("n", "gO", ":FzfLua live_grep", { noremap = true, silent = true })
vim.keymap.set("n", "go", "<nop>", { noremap = true, silent = true })
vim.keymap.set("n", "go", ":FzfLua grep_quickfix", { noremap = true, silent = true })
vim.keymap.set("n", "gn", ":cn <cr> :normal! zz <cr>", { noremap = true, silent = true })
vim.keymap.set("n", "gp", ":cp <cr> :normal! zz <cr>", { noremap = true, silent = true })

vim.keymap.set("n", "<c-j>", ":FzfLua files<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<c-k>", ":FzfLua buffers<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<c-n>", ":FzfLua blines<cr>", { noremap = true, silent = true })

vim.api.nvim_create_user_command(
  "Greeting", -- The name of your custom command
  function()
    print("Hello from MyCommand!")
  end,
  {
    desc = "Simple custom comnand", -- Optional: Description for the command
  }
)

local coq = require "coq" -- add this

-- legacy style
local lsp = require "lspconfig"
-- lsp.pyright.setup(coq.lsp_ensure_capabilities()) -- after

-- new style
vim.lsp.config("pyright", coq.lsp_ensure_capabilities()) -- after
vim.lsp.enable("pyright")


local function hide_diagnostics()
    vim.diagnostic.config({  -- https://neovim.io/doc/user/diagnostic.html
        virtual_text = false,
        signs = false,
        underline = false,
    })
end
local function show_diagnostics()
    vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
    })
end
vim.keymap.set("n", "<F7>", hide_diagnostics)
vim.keymap.set("n", "<F8>", show_diagnostics)
