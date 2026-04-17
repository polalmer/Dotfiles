-- Midnight X (MicroEmacs -> Neovim conversion)

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
end

vim.g.colors_name = "midnight_x"

local c = {
    background = "#1e1e1e",
    foreground = "#d2d2d2",

    yellow     = "#facd28",
    blue       = "#6495ed",
    green      = "#60fbb3",
    cyan       = "#87cefa",
    violet     = "#ed87fa",
    teal       = "#91b6c7",
    khaki      = "#f0e68c",
    orange     = "#ffa500",
    gray       = "#949494",
    magenta    = "#f0a0f0",
    pink       = "#ffb4af",
    red        = "#ff8282",

    white      = "#e7e7e7",
}

local function hi(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

-- UI

hi("Normal",       { fg=c.foreground, bg=c.background })
hi("CursorLine",   { bg=c.background })
hi("CursorColumn", { bg=c.background })

hi("Visual",       { bg=c.violet })
hi("LineNr",       { fg=c.gray })
hi("CursorLineNr", { fg=c.yellow })

hi("StatusLine",   { fg=c.foreground, bg=c.background })
hi("StatusLineNC", { fg=c.gray, bg=c.background })

hi("VertSplit",    { fg=c.background })
hi("WinSeparator", { fg=c.background })

hi("Pmenu",        { fg=c.foreground, bg=c.background })
hi("PmenuSel",     { fg=c.background, bg=c.violet })

hi("Search",       { fg=c.background, bg=c.yellow })
hi("IncSearch",    { fg=c.background, bg=c.orange })

hi("Folded",       { fg=c.gray, bg=c.background })
hi("FoldColumn",   { fg=c.gray })

hi("SignColumn",   { bg=c.background })

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
hi("Delimiter",    { fg=c.foreground })
hi("SpecialComment",{ fg=c.gray })

hi("Error",        { fg=c.red, bold=true })
hi("Todo",         { fg=c.yellow, bold=true })

-- Diff

hi("DiffAdd",      { fg=c.green })
hi("DiffChange",   { fg=c.yellow })
hi("DiffDelete",   { fg=c.red })
hi("DiffText",     { fg=c.blue })


-- GitSigns (optional)

hi("GitSignsAdd",    { fg=c.green })
hi("GitSignsChange", { fg=c.yellow })
hi("GitSignsDelete", { fg=c.red })


local lualine_theme = {
    normal = {
        a = { fg = c.background, bg = c.blue, gui = "bold" },
        b = { fg = c.foreground, bg = c.background },
        c = { fg = c.foreground, bg = c.background },
    },

    insert = {
        a = { fg = c.background, bg = c.green, gui = "bold" },
        b = { fg = c.foreground, bg = c.background },
    },

    visual = {
        a = { fg = c.background, bg = c.violet, gui = "bold" },
        b = { fg = c.foreground, bg = c.background },
    },

    replace = {
        a = { fg = c.background, bg = c.red, gui = "bold" },
        b = { fg = c.foreground, bg = c.background },
    },

    command = {
        a = { fg = c.background, bg = c.orange, gui = "bold" },
        b = { fg = c.foreground, bg = c.background },
    },

    inactive = {
        a = { fg = c.gray, bg = c.background },
        b = { fg = c.gray, bg = c.background },
        c = { fg = c.gray, bg = c.background },
    },
}

-- Export so init.lua can use it
_G.midnight_x_lualine_theme = lualine_theme
