vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
end

vim.g.colors_name = "midnight_x"

local c = {
    background = "#1e1e1e",
    foreground = "#d2d2d2",

    yellow     = "#FAF728",
    pink       = "#FA2894",
    purple     = "#F728FA",
    green      = "#08BF5F",
    cyan       = "#87cefa",
    gray       = "#949494",
    red        = "#FF2E2E",

    white      = "#e7e7e7",
}

local function hi(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

-- UI

hi("Normal",       { fg=c.foreground, bg=c.background })
hi("CursorLine",   { bg=c.background })
hi("CursorColumn", { bg=c.background })

hi("LineNr",       { fg=c.gray })
hi("CursorLineNr", { fg=c.yellow })

hi("StatusLine",   { fg=c.foreground, bg=c.background })
hi("StatusLineNC", { fg=c.gray, bg=c.background })

hi("VertSplit",    { fg=c.background })
hi("WinSeparator", { fg=c.background })

hi("Pmenu",        { fg=c.foreground, bg=c.background })

hi("Search",       { fg=c.background, bg=c.yellow })
hi("IncSearch",    { fg=c.background, bg=c.purple })

hi("Folded",       { fg=c.gray, bg=c.background })
hi("FoldColumn",   { fg=c.gray })

hi("SignColumn",   { bg=c.background })

-- Syntax

hi("Comment",      { fg=c.gray, italic=true })

hi("Constant",     { fg=c.purple })
hi("String",       { fg=c.purple })
hi("Character",    { fg=c.purple })
hi("Number",       { fg=c.purple })
hi("Boolean",      { fg=c.purple })
hi("Float",        { fg=c.purple })

hi("Identifier",   { fg=c.yellow })
hi("Function",     { fg=c.pink, bold=true })

hi("Statement",    { fg=c.cyan })
hi("Conditional",  { fg=c.cyan })
hi("Repeat",       { fg=c.cyan })
hi("Label",        { fg=c.cyan })
hi("Operator",     { fg=c.cyan })
hi("Keyword",      { fg=c.cyan })

hi("PreProc",      { fg=c.cyan })
hi("Include",      { fg=c.cyan })
hi("Define",       { fg=c.cyan })
hi("Macro",        { fg=c.cyan })

hi("Type",         { fg=c.green })
hi("StorageClass", { fg=c.green })
hi("Structure",    { fg=c.green })
hi("Typedef",      { fg=c.green })

hi("Special",      { fg=c.pink })
hi("SpecialChar",  { fg=c.pink })
hi("Tag",          { fg=c.pink })
hi("Delimiter",    { fg=c.foreground })
hi("SpecialComment",{ fg=c.gray })

hi("Error",        { fg=c.red, bold=true })
hi("Todo",         { fg=c.yellow, bold=true })


local lualine_theme = {
    normal = {
        a = { fg = c.background, bg = c.purple, gui = "bold" },
        b = { fg = c.foreground, bg = c.background },
        c = { fg = c.foreground, bg = c.background },
    },

    insert = {
        a = { fg = c.background, bg = c.yellow, gui = "bold" },
        b = { fg = c.foreground, bg = c.background },
    },

    visual = {
        a = { fg = c.background, bg = c.cyan, gui = "bold" },
        b = { fg = c.foreground, bg = c.background },
    },

    replace = {
        a = { fg = c.background, bg = c.red, gui = "bold" },
        b = { fg = c.foreground, bg = c.background },
    },

    command = {
        a = { fg = c.background, bg = c.green, gui = "bold" },
        b = { fg = c.foreground, bg = c.background },
    },

    inactive = {
        a = { fg = c.gray, bg = c.background },
        b = { fg = c.gray, bg = c.background },
        c = { fg = c.gray, bg = c.background },
    },
}

-- Export so init.lua can use it
midnight_x_lualine_theme = lualine_theme
