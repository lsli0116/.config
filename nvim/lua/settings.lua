-- create a _machine_specific.lua file to adjust machine stuff
--vim.g.has_machine_specific_file = 1
--if(vim.fn.empty(vim.fn.glob("~/.config/nvim/_machine_specific.lua"))) then
--  vim.g.has_machine_specific_file = 0
--  vim.cmd([[silent! exec "!cp ~/.config/nvim/default_configs/_machine_specific_default.lua ~/.config/nvim/_machine_specific.lua"]])
--  vim.cmd([[exec "e ~/.config/nvim/_machine_specific.lua"]])
--end
vim.cmd("source $XDG_CONFIG_HOME/nvim/_machine_specific.lua")

print(vim.fn.empty(vim.fn.glob("~/.config/nvim/_machine_specific.lua")))
-- Editor Setup

vim.o.autochdir = true
vim.o.clipboard = "unnamedplus"

-- Editor behavior

vim.o.exrc = true
vim.o.secure = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.hidden = true
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.autoindent = true
vim.o.list = true
vim.o.listchars = "tab:| ,trail: "
vim.o.scrolloff = 4
vim.o.ttimeoutlen = 0
vim.o.timeout = false
vim.o.viewoptions = "cursor,folds,slash,unix"
vim.o.wrap = true
vim.o.tw = 0
vim.o.indentexpr = ""
vim.o.foldmethod = "indent"
vim.o.foldlevel = 99
vim.o.foldenable = true
vim.o.formatoptions = vim.o.formatoptions:gsub("tc", "")
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.showmode = false
vim.o.showcmd = true
vim.o.wildmenu = true
vim.o.wildignore = "*.o,*.obj,*~,*.so,*.swp,*.DS_Store" -- stuff to ignore when tab completing
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.inccommand = "split"
vim.o.completeopt = "longest,noinsert,menuone,noselect,preview"
vim.o.ttyfast = true --should make scrolling faster
vim.o.lazyredraw = true --same as above
vim.o.visualbell = true

vim.cmd("silent !mkdir -p ~/.config/nvim/tmp/backup")
vim.cmd("silent !mkdir -p ~/.config/nvim/tmp/undo")
vim.o.backupdir = "~/.config/nvim/tmp/backup,."
vim.o.directory = "~/.config/nvim/tmp/backup,."
vim.o.undofile = true
vim.o.undodir = "~/.config/nvim/tmp/undo,."

vim.wo.colorcolumn = "100"
vim.g.updatetime = 100
vim.o.virtualedit = "block"
vim.o.encoding = "utf-8"

-- Highlight on yank

vim.cmd([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]])
