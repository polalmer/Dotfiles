local vim = vim
local Plug = vim.fn['plug#']

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true
vim.opt.clipboard:append("unnamedplus")
vim.opt.number = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

--Plug Area
vim.call('plug#begin')
    -- BottomInfobar
    Plug('nvim-lualine/lualine.nvim')
    -- HexColor Highlighting
    --Plug('norcalli/nvim-colorizer.lua')
    -- manage language servers
    --Plug('nvim-treesitter/nvim-treesitter')
vim.call('plug#end')

--require('colorizer').setup()

--lualine config
vim.cmd.colorscheme("midnightX")
require("lualine").setup({
    options = {
        theme = midnightX_lualine_theme,
        section_separators = "",
        component_separators = "",
    }
})

-- treesitter config
--require('nvim-treesitter').install { 
--    'javascript',
--    'python',
--    'sql',
--    'html',
--    'css',
--    'lua'
--}

