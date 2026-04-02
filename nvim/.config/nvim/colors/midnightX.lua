-- Midnight X (MicroEmacs -> Neovim conversion)

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
end

vim.g.colors_name = "midnight_x"

local c = {
    bg         = "#000000", -- color 0
    bg_soft    = "#1e1e1e", -- color 1
    fg         = "#d2d2d2", -- color 2
    fg_bright  = "#e6e6e6", -- color 3

    yellow     = "#facd28", -- 4
    blue       = "#6495ed", -- 5
    green      = "#8bf59f", -- 6
    cyan       = "#87cefa", -- 7
    violet     = "#9092ff", -- 8
    teal       = "#91b6c7", -- 9
    khaki      = "#f0e68c", -- 10
    orange     = "#ffa500", -- 11
    gray       = "#949494", -- 12
    magenta    = "#f0a0f0", -- 13
    pink       = "#ffb4af", -- 14
    red        = "#ff8282", -- 15

    white      = "#ffffff", -- 17
}

local function hi(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

-- UI

hi("Normal",       { fg=c.fg, bg=c.bg })
hi("CursorLine",   { bg=c.bg_soft })
hi("CursorColumn", { bg=c.bg_soft })

hi("Visual",       { bg=c.violet })
hi("LineNr",       { fg=c.gray })
hi("CursorLineNr", { fg=c.yellow })

hi("StatusLine",   { fg=c.fg_bright, bg=c.bg_soft })
hi("StatusLineNC", { fg=c.gray, bg=c.bg_soft })

hi("VertSplit",    { fg=c.bg_soft })
hi("WinSeparator", { fg=c.bg_soft })

hi("Pmenu",        { fg=c.fg, bg=c.bg_soft })
hi("PmenuSel",     { fg=c.bg, bg=c.violet })

hi("Search",       { fg=c.bg, bg=c.yellow })
hi("IncSearch",    { fg=c.bg, bg=c.orange })

hi("Folded",       { fg=c.gray, bg=c.bg_soft })
hi("FoldColumn",   { fg=c.gray })

hi("SignColumn",   { bg=c.bg })

-- Syntax

hi("Comment",      { fg=c.gray, italic=true })

hi("Constant",     { fg=c.orange })
hi("String",       { fg=c.magenta })
hi("Character",    { fg=c.magenta })
hi("Number",       { fg=c.orange })
hi("Boolean",      { fg=c.orange })
hi("Float",        { fg=c.orange })

hi("Identifier",   { fg=c.khaki })
hi("Function",     { fg=c.green, bold=true })

hi("Statement",    { fg=c.cyan })
hi("Conditional",  { fg=c.cyan })
hi("Repeat",       { fg=c.cyan })
hi("Label",        { fg=c.cyan })
hi("Operator",     { fg=c.teal })
hi("Keyword",      { fg=c.cyan })

hi("PreProc",      { fg=c.blue })
hi("Include",      { fg=c.blue })
hi("Define",       { fg=c.blue })
hi("Macro",        { fg=c.blue })

hi("Type",         { fg=c.violet })
hi("StorageClass", { fg=c.violet })
hi("Structure",    { fg=c.violet })
hi("Typedef",      { fg=c.violet })

hi("Special",      { fg=c.pink })
hi("SpecialChar",  { fg=c.pink })
hi("Tag",          { fg=c.pink })
hi("Delimiter",    { fg=c.fg })
hi("SpecialComment",{ fg=c.gray })

hi("Error",        { fg=c.red, bold=true })
hi("Todo",         { fg=c.yellow, bold=true })

-- Diff

hi("DiffAdd",      { fg=c.green })
hi("DiffChange",   { fg=c.yellow })
hi("DiffDelete",   { fg=c.red })
hi("DiffText",     { fg=c.blue })

-- Diagnostics (LSP)

hi("DiagnosticError", { fg=c.red })
hi("DiagnosticWarn",  { fg=c.orange })
hi("DiagnosticInfo",  { fg=c.violet })
hi("DiagnosticHint",  { fg=c.cyan })

-- Treesitter (important for modern Neovim)

hi("@comment",  { link="Comment" })
hi("@string",   { link="String" })
hi("@number",   { link="Number" })
hi("@function", { link="Function" })
hi("@keyword",  { link="Keyword" })
hi("@type",     { link="Type" })
hi("@variable", { fg=c.khaki })

-- GitSigns (optional)

hi("GitSignsAdd",    { fg=c.green })
hi("GitSignsChange", { fg=c.yellow })
hi("GitSignsDelete", { fg=c.red })
-- Lualine theme derived from Midnight X palette

local lualine_theme = {
    normal = {
        a = { fg = c.bg, bg = c.blue, gui = "bold" },
        b = { fg = c.fg, bg = c.bg_soft },
        c = { fg = c.fg, bg = c.bg },
    },

    insert = {
        a = { fg = c.bg, bg = c.green, gui = "bold" },
        b = { fg = c.fg, bg = c.bg_soft },
    },

    visual = {
        a = { fg = c.bg, bg = c.violet, gui = "bold" },
        b = { fg = c.fg, bg = c.bg_soft },
    },

    replace = {
        a = { fg = c.bg, bg = c.red, gui = "bold" },
        b = { fg = c.fg, bg = c.bg_soft },
    },

    command = {
        a = { fg = c.bg, bg = c.orange, gui = "bold" },
        b = { fg = c.fg, bg = c.bg_soft },
    },

    inactive = {
        a = { fg = c.gray, bg = c.bg_soft },
        b = { fg = c.gray, bg = c.bg_soft },
        c = { fg = c.gray, bg = c.bg },
    },
}

-- Export so init.lua can use it
_G.midnight_x_lualine_theme = lualine_theme
