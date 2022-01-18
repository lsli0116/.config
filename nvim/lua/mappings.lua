--
-- Basic Mappings
--

-- Set <LEADER> as <SPACE>, ; as :
vim.g.mapleader = " "
vim.api.nvim_set_keymap("", ";", ":", { noremap = true })

-- Save & quit
vim.api.nvim_set_keymap("", "Q", ":q<CR>", { noremap = true })
vim.api.nvim_set_keymap("", "<C-q>", ":qa<CR>", { noremap = true })
vim.api.nvim_set_keymap("", "S", ":w<CR>", { noremap = true })

-- Open the vimrc file anytime
vim.api.nvim_set_keymap("", "<LEADER>rc", ":e ~/.config/nvim/init.lua<CR>", { noremap = true })
-- vim.api.nvim_set_keymap("", "<LEADER>rv", ":e ~/.config/nvim/coc-settings.json<CR>", { noremap = true, })

-- Undo operations
vim.api.nvim_set_keymap("", "l", "u", { noremap = true })

-- Insert Key
vim.api.nvim_set_keymap("", "k", "i", { noremap = true })
vim.api.nvim_set_keymap("", "K", "I", { noremap = true })

-- make Y to copy till the end of the line
vim.api.nvim_set_keymap("n", "Y", "y$", { noremap = true })

-- Copy to system clipboard
vim.api.nvim_set_keymap("v", "Y", "--+y", { noremap = true })

-- Indentation
vim.api.nvim_set_keymap("n", "<", "<<", { noremap = true })
vim.api.nvim_set_keymap("n", ">", ">>", { noremap = true })

-- Search
vim.api.nvim_set_keymap("", "<LEADER><CR>", ":nohlsearch<CR>", { noremap = true })

-- Adjacent duplicate words
vim.api.nvim_set_keymap("", "<LEADER>dw", "/\\(\\<\\w\\+\\>\\)\\_s*\\1", { noremap = true })

-- Space to Tab
vim.api.nvim_set_keymap("n", "<LEADER>tt", ":%s/    /\\t/g", { noremap = true })
vim.api.nvim_set_keymap("v", "<LEADER>tt", ":s/    /\\t/g", { noremap = true })

-- folding
vim.api.nvim_set_keymap("", "<leader>o", "za", { silent = true, noremap = true })

-- nnoremap <c-n> :tabe<CR>:-tabmove<CR>:term lazynpm<CR>

--
-- Cursor Movement
--
-- New cursor movement (the default arrow keys are used for resizing windows)
--     ^
--     u
-- < n   i >
--     e
--     v

vim.api.nvim_set_keymap("", "u", "k", { silent = true, noremap = true })
vim.api.nvim_set_keymap("", "n", "h", { silent = true, noremap = true })
vim.api.nvim_set_keymap("", "e", "j", { silent = true, noremap = true })
vim.api.nvim_set_keymap("", "i", "l", { silent = true, noremap = true })
vim.api.nvim_set_keymap("", "gu", "gk", { silent = true, noremap = true })
vim.api.nvim_set_keymap("", "ge", "gj", { silent = true, noremap = true })
vim.api.nvim_set_keymap("", "\\v", "v$h", { silent = true, noremap = true })

-- U/E keys for 5 times u/e (faster navigation)
vim.api.nvim_set_keymap("", "U", "5k", { silent = true, noremap = true })
vim.api.nvim_set_keymap("", "E", "5j", { silent = true, noremap = true })

-- N key: go to the start of the line
vim.api.nvim_set_keymap("", "N", "0", { silent = true, noremap = true })
-- I key: go to the end of the line
vim.api.nvim_set_keymap("", "I", "$", { silent = true, noremap = true })

-- Faster in-line navigation
vim.api.nvim_set_keymap("", "W", "5w", { noremap = true })
vim.api.nvim_set_keymap("", "B", "5b", { noremap = true })

-- set h (same as n, cursor left) to 'end of word'
vim.api.nvim_set_keymap("", "h", "e", { noremap = true })

-- Ctrl + U or E will move up/down the view port without moving the cursor
vim.api.nvim_set_keymap("", "<C-U>", "5<C-y>", { noremap = true })
vim.api.nvim_set_keymap("", "<C-E>", "5<C-e>", { noremap = true })

-- source $XDG_CONFIG_HOME/nvim/cursor.vim

--If you use Qwerty keyboard, uncomment the next line.
--source $XDG_CONFIG_HOME/nvim/cursor_for_qwerty.vim

--
--  Insert Mode Cursor Movement
--
vim.api.nvim_set_keymap("i", "<C-a>", "<ESC>A", { noremap = true })

--
--  Command Mode Cursor Movement
--
vim.api.nvim_set_keymap("c", "<C-a>", "<Home>", { noremap = true })
vim.api.nvim_set_keymap("c", "<C-e>", "<End>", { noremap = true })
vim.api.nvim_set_keymap("c", "<C-p>", "<Up>", { noremap = true })
vim.api.nvim_set_keymap("c", "<C-n>", "<Down>", { noremap = true })
vim.api.nvim_set_keymap("c", "<C-b>", "<Left>", { noremap = true })
vim.api.nvim_set_keymap("c", "<C-f>", "<Right>", { noremap = true })
vim.api.nvim_set_keymap("c", "<M-b>", "<S-Left>", { noremap = true })
vim.api.nvim_set_keymap("c", "<M-w>", "<S-Right>", { noremap = true })

--
--  Searching
--
vim.api.nvim_set_keymap("", "-", "N", { noremap = true })
vim.api.nvim_set_keymap("", "=", "n", { noremap = true })

--
--  Window management
--
-- Use <space> + new arrow keys for moving the cursor around windows
vim.api.nvim_set_keymap("", "<LEADER>w", "<C-w>w", { noremap = true })
vim.api.nvim_set_keymap("", "<LEADER>u", "<C-w>k", { noremap = true })
vim.api.nvim_set_keymap("", "<LEADER>e", "<C-w>j", { noremap = true })
vim.api.nvim_set_keymap("", "<LEADER>n", "<C-w>h", { noremap = true })
vim.api.nvim_set_keymap("", "<LEADER>i", "<C-w>l", { noremap = true })
vim.api.nvim_set_keymap("", "qf", "<C-w>o", { noremap = true })

--
-- Disable the default s key
vim.api.nvim_set_keymap("", "s", "<nop>", { noremap = true })

-- split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
vim.api.nvim_set_keymap("", "su", ":set nosplitbelow<CR>:split<CR>:set splitbelow<CR>", { noremap = true })
vim.api.nvim_set_keymap("", "se", ":set splitbelow<CR>:split<CR>", { noremap = true })
vim.api.nvim_set_keymap("", "sn", ":set nosplitright<CR>:vsplit<CR>:set splitright<CR>", { noremap = true })
vim.api.nvim_set_keymap("", "si", ":set splitright<CR>:vsplit<CR>", { noremap = true })

-- Resize splits with arrow keys
vim.api.nvim_set_keymap("", "<up>", ":res +5<CR>", { noremap = true })
vim.api.nvim_set_keymap("", "<down>", ":res -5<CR>", { noremap = true })
vim.api.nvim_set_keymap("", "<left>", ":vertical resize-5<CR>", { noremap = true })
vim.api.nvim_set_keymap("", "<right>", ":vertical resize+5<CR>", { noremap = true })

-- Place the two screens up and down
vim.api.nvim_set_keymap("", "sh", "<C-w>t<C-w>K", { noremap = true })
-- Place the two screens side by side
vim.api.nvim_set_keymap("", "sv", "<C-w>t<C-w>H", { noremap = true })

-- Rotate screens
vim.api.nvim_set_keymap("", "srh", "<C-w>b<C-w>K", { noremap = true })
vim.api.nvim_set_keymap("", "srv", "<C-w>b<C-w>H", { noremap = true })

-- Press <SPACE> + q to close the window below the current window
vim.api.nvim_set_keymap("", "<LEADER>q", "<C-w>j:q<CR>", { noremap = true })

--
--  Tab management
--
-- Create a new tab with tu
vim.api.nvim_set_keymap("", "<leader>tu", ":tabe<CR>", { noremap = true })
-- Move around tabs with tn and ti
vim.api.nvim_set_keymap("", "<leader>tn", ":-tabnext<CR>", { noremap = true })
vim.api.nvim_set_keymap("", "<leader>ti", ":+tabnext<CR>", { noremap = true })
-- Move the tabs with tmn and tmi
vim.api.nvim_set_keymap("", "<leader>tmn", ":-tabmove<CR>", { noremap = true })
vim.api.nvim_set_keymap("", "<leader>tmi", ":+tabmove<CR>", { noremap = true })

--
--  Markdown Settings
--
-- Snippets
require("md-snippets")
-- auto spell
-- autocmd BufRead,BufNewFile *.md setlocal spell

--
-- Other useful stuff
--

-- Open a new instance of st with the cwd
vim.api.nvim_set_keymap("n", "\\t", ":tabe<CR>:-tabmove<CR>:term sh -c 'zsh'<CR>", { noremap = true })

-- Opening a terminal window
vim.api.nvim_set_keymap("", "<LEADER>/", ":set splitbelow<CR>:split<CR>:res +10<CR>:term<CR>", { noremap = true })
vim.api.nvim_set_keymap("t", "<C-N>", "<C-\\><C-N>", { noremap = true })
vim.api.nvim_set_keymap("t", "<C-O>", "<C-\\><C-N><C-O>", { noremap = true })

-- Press space twice to jump to the next '' and edit it
vim.api.nvim_set_keymap("", "<LEADER><LEADER>", "<Esc>/<++><CR>:nohlsearch<CR>c4l", { noremap = true })

-- Spelling Check with <space>sc
vim.api.nvim_set_keymap("", "<LEADER>sc", ":set spell!<CR>", { noremap = true })

-- Press ` to change case (instead of ~)
vim.api.nvim_set_keymap("", "`", "~", { noremap = true })

vim.api.nvim_set_keymap("", "<C-c>", "zz", { noremap = true })

-- Auto change directory to current dir
-- autocmd BufEnter * silent! lcd %:p:h

-- Call figlet
vim.api.nvim_set_keymap("", "tx", ":r !figlet ", { noremap = true })

-- find and replace
vim.api.nvim_set_keymap("", "\\s", ":%s//g<left><left>", { noremap = true })

-- set wrap 设置自动换行
vim.api.nvim_set_keymap("", "<LEADER>sw", ":set wrap<CR>", { noremap = true })

-- Change character
vim.api.nvim_set_keymap("", "c", "r", { noremap = true })

-- Pandoc to word

function Pandoc2word()
	vim.cmd([[
	!pandoc %:t -s -o %:t:r.docx 
  \ -F zotref.py 
  \ --lua-filter=scholarly-metadata.lua 
  \ --lua-filter=author-info-blocks.lua 
  \ --lua-filter=abstract-to-meta.lua 
  \ --citeproc 
  \ --reference-doc=$PANDOC_DIR/templates/custom-reference.docx]])
end

vim.api.nvim_set_keymap("n", "tw", ":lua Pandoc2word()<CR>", { noremap = true })

function CompileRunGcc()
	if vim.bo.filetype == "c" then
		vim.cmd("!g++ % -o %<")
		vim.cmd("!time  ./%<")
	elseif vim.bo.filetype == "cpp" then
		vim.o.splitbelow = true
		vim.cmd("!clang++ -std=c++20 *.cpp -Wall -L. -o %<")
		vim.cmd("sp")
		vim.cmd("res -15")
		vim.cmd("term ./%<")
	elseif vim.bo.filetype == "java" then
		vim.o.splitbelow = true
		vim.cmd("!g++ -std=c++20 -g % -Wall -o %<")
		vim.cmd("sp")
		vim.cmd("res -15")
		vim.cmd("term javac % && time jave %<")
	elseif vim.bo.filetype == "sh" then
		vim.cmd("!time bash %")
	elseif vim.bo.filetype == "python" then
		vim.o.splitbelow = true
		vim.cmd("sp")
		vim.cmd("term python %")
	elseif vim.bo.filetype == "html" then
		vim.cmd("!safari % &")
	elseif vim.bo.filetype == "markdown" then
		vim.cmd("MarkdownPreview")
	elseif vim.bo.filetype == "tex" then
		vim.cmd("VimtexStop")
		vim.cmd("VimtexCompile")
	elseif vim.bo.filetype == "javascript" then
		vim.o.splitbelow = true
		vim.cmd("sp")
		vim.cmd('term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .')
	elseif vim.bo.filetype == "go" then
		vim.o.splitbelow = true
		vim.cmd("sp")
		vim.cmd("term go run .")
	end
end

-- Compile function
vim.api.nvim_set_keymap("n", "r", ":lua CompileRunGcc()<CR>", { noremap = true })
