-- rnvimr
vim.g["rnvimr_ex_enable"] = 1
vim.g["rnvimr_pick_enable"] = 1
vim.g["rnvimr_draw_border"] = 0
vim.cmd("highlight link RnvimrNormal CursorLine")
vim.api.nvim_set_keymap("n","R",":RnvimrToggle<CR><C-\\><C-n>:RnvimrResize 0<CR>",{noremap = true, silent = true,})
--vim.api.nvim_set_keymap("n","R",":RnvimrToggle<CR>",{noremap = true, silent = true,})


vim.g["rnvimr_urc_path"] = '/Users/lsli/.config/ranger'
vim.g.rnvimr_layout = {
    relative= 'editor',
    width= vim.o.columns,
    height = vim.o.lines,
    col= 0,
    row= 0,
    style = 'minimal',
    border = 'double'
}

-- undotree
vim.api.nvim_set_keymap("n","L",":UndotreeToggle<CR>",{noremap = true, silent = true,})
vim.g.undotree_DiffAutoOpen = 1
vim.g.undotree_SetFocusWhenToggle = 1
vim.g.undotree_ShortIndicators = 1
vim.g.undotree_WindowLayout = 2
vim.g.undotree_DiffpanelHeight = 8
vim.g.undotree_SplitWidth = 24


local function Undotree_CustomMap()
  vim.api.nvim_buf_set_keymap(0,'n','u',"<plug>UndotreeNextState",{})
  vim.api.nvim_buf_set_keymap(0,'n','e',"<plug>UndotreePreviousState",{})
  vim.api.nvim_buf_set_keymap(0,'n','U',"<plug>UndotreeNextState",{})
  vim.api.nvim_buf_set_keymap(0,'n','E',"<plug>UndotreePreviousState",{})
end

vim.g.Undotree_CustomMap = Undotree_CustomMap

-- map to lua
vim.api.nvim_set_keymap('n','<LEADER>cm',[[<cmd>lua require("map-to-lua").convert_line()<cr>]],{noremap=true})


-- bufferline
vim.opt.termguicolors = true

require('bufferline').setup {
  options = {
    numbers = "none" ,
    close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
    right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
    middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"
    indicator_icon = '▎',
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    tab_size = 18,
    diagnostics = "nvim_lsp"  ,
    diagnostics_update_in_insert = false,

    show_buffer_icons = true, -- disable filetype icons for buffers
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    separator_style = "slant" ,
    enforce_regular_tabs = false ,
    always_show_bufferline = false,
  }
}

-- These commands will navigate through buffers in order regardless of which mode you are using
-- e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
vim.api.nvim_set_keymap("n", "ti", ":BufferLineCycleNext<CR>", { silent = true, noremap = true, })
vim.api.nvim_set_keymap("n", "tn", ":BufferLineCyclePrev<CR>", { silent = true, noremap = true, })

-- These commands will move the current buffer backwards or forwards in the bufferline
vim.api.nvim_set_keymap("n", "tmi", ":BufferLineMoveNext<CR>", { silent = true, noremap = true, })
vim.api.nvim_set_keymap("n", "tmn", ":BufferLineMovePrev<CR>", { silent = true, noremap = true, })
vim.api.nvim_set_keymap("n", "txi", ":BufferLineCloseRight<CR>", { silent = true, noremap = true, })
vim.api.nvim_set_keymap("n", "txn", ":BufferLineCloseLeft<CR>", { silent = true, noremap = true, })

-- These commands will sort buffers by directory, language, or a custom criteria

vim.api.nvim_set_keymap("n", "te", ":BufferLineSortByExtension<CR>", { silent = true, noremap = true, })
vim.api.nvim_set_keymap("n", "td", ":BufferLineSortByDirectory<CR>", { silent = true, noremap = true, })


-- status line
local windline = require("windline")
local helper = require("windline.helpers")
local b_components = require("windline.components.basic")
local state = _G.WindLine.state

local lsp_comps = require("windline.components.lsp")
local git_comps = require("windline.components.git")

local hl_list = {
    Black = { "white", "black" },
    White = { "black", "white" },
    Inactive = { "InactiveFg", "InactiveBg" },
    Active = { "ActiveFg", "ActiveBg" },
}
local basic = {}

local breakpoint_width = 90
basic.divider = { b_components.divider, "" }
basic.bg = { " ", "StatusLine" }

local colors_mode = {
    Normal = { "blue", "black" },
    Insert = { "green", "black" },
    Visual = { "yellow", "black" },
    Replace = { "blue_light", "black" },
    Command = { "magenta", "black" },
}

basic.vi_mode = {
    name = "vi_mode",
    hl_colors = colors_mode,
    text = function()
        return { { "  ", state.mode[2] } }
    end,
}

basic.lsp_diagnos = {
    name = "diagnostic",
    hl_colors = {
        red = { "red", "black" },
        yellow = { "yellow", "black" },
        blue = { "blue", "black" },
    },
    width = breakpoint_width,
    text = function(bufnr)
        if lsp_comps.check_lsp(bufnr) then
            return {
                { lsp_comps.lsp_error({ format = "  %s", show_zero = true }), "red" },
                { lsp_comps.lsp_warning({ format = "  %s", show_zero = true }), "yellow" },
                { lsp_comps.lsp_hint({ format = "  %s", show_zero = true }), "blue" },
            }
        end
        return ""
    end,
}
basic.file = {
    name = "file",
    hl_colors = {
        default = hl_list.Black,
        white = { "white", "black" },
        magenta = { "magenta", "black" },
    },
    text = function(_, _, width)
        if width > breakpoint_width then
            return {
                { b_components.cache_file_name("[No Name]", "unique"), "magenta" },
                { b_components.line_col_lua, "white" },
                { b_components.progress_lua, "" },
                { " ", "" },
                { b_components.file_modified(" "), "magenta" },
            }
        else
            return {
                { b_components.cache_file_name("[No Name]", "unique"), "magenta" },
                { " ", "" },
                { b_components.file_modified(" "), "magenta" },
            }
        end
    end,
}
basic.file_right = {
    hl_colors = {
        default = hl_list.Black,
        white = { "white", "black" },
        magenta = { "magenta", "black" },
    },
    text = function(_, _, width)
        if width < breakpoint_width then
            return {
                { b_components.line_col_lua, "white" },
                { b_components.progress_lua, "" },
            }
        end
    end,
}
basic.git = {
    name = "git",
    hl_colors = {
        green = { "green", "black" },
        red = { "red", "black" },
        blue = { "blue", "black" },
    },
    width = breakpoint_width,
    text = function(bufnr)
        if git_comps.is_git(bufnr) then
            return {
                { git_comps.diff_added({ format = "  %s", show_zero = true }), "green" },
                { git_comps.diff_removed({ format = "  %s", show_zero = true }), "red" },
                { git_comps.diff_changed({ format = " 柳%s", show_zero = true }), "blue" },
            }
        end
        return ""
    end,
}

local quickfix = {
    filetypes = { "qf", "Trouble" },
    active = {
        { "🚦 Quickfix ", { "white", "black" } },
        { helper.separators.slant_right, { "black", "black_light" } },
        {
            function()
                return vim.fn.getqflist({ title = 0 }).title
            end,
            { "cyan", "black_light" },
        },
        { " Total : %L ", { "cyan", "black_light" } },
        { helper.separators.slant_right, { "black_light", "InactiveBg" } },
        { " ", { "InactiveFg", "InactiveBg" } },
        basic.divider,
        { helper.separators.slant_right, { "InactiveBg", "black" } },
        { "🧛 ", { "white", "black" } },
    },

    always_active = true,
    show_last_status = true,
}

basic.lsp_name = {
    width = breakpoint_width,
    name = "lsp_name",
    hl_colors = {
        magenta = { "magenta", "black" },
    },
    text = function(bufnr)
        if lsp_comps.check_lsp(bufnr) then
            return {
                { lsp_comps.lsp_name(), "magenta" },
            }
        end
        return {
            { b_components.cache_file_type({ icon = true }), "magenta" },
        }
    end,
}

local default = {
    filetypes = { "default" },
    active = {
        basic.vi_mode,
        basic.file,
        basic.lsp_diagnos,
        basic.divider,
        basic.file_right,
        basic.lsp_name,
        basic.git,
        { git_comps.git_branch(), { "magenta", "black" }, breakpoint_width },
        { " ", hl_list.Black },
    },
    inactive = {
        { b_components.full_file_name, hl_list.Inactive },
        basic.file_name_inactive,
        basic.divider,
        basic.divider,
        { b_components.line_col, hl_list.Inactive },
        { b_components.progress, hl_list.Inactive },
    },
}

windline.setup({
    colors_name = function(colors)
        colors.ActiveBg = "#282c34"
        colors.InactiveBg = "#282c34"
        colors.InactiveFg = "#bbbbbb"
        colors.black = "#282c34"
        colors.magenta = "#6677dd"
        colors.yellow = "#7385e2"
        colors.green = "#98c379"
        return colors
    end,
    statuslines = {
        default,
        quickfix,
    },
})
