local vim = vim
local Plug = vim.fn['plug#']

vim.opt.termguicolors = true
vim.opt.clipboard:append("unnamedplus")
vim.opt.number = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- activate an installed language server for vim
vim.lsp.enable('pyright')

--Plug Area
vim.call('plug#begin')
    -- BottomInfobar
    Plug('nvim-lualine/lualine.nvim')
    Plug('neovim/nvim-lspconfig')
    -- Theme
    Plug('navarasu/onedark.nvim')
vim.call('plug#end')

-- Set onedark as colorschema
require('onedark').setup  {
    -- Main options --
    style = 'warmer',
    transparent = false,  -- Show/hide background
    term_colors = true, -- Change terminal color as per the selected theme style
    ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
    cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu
    
    -- Change code style ---
    -- Options are italic, bold, underline, none
    -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
    code_style = {
        comments = 'italic',
        keywords = 'none',
        functions = 'none',
        strings = 'none',
        variables = 'none'
    },
}
require('onedark').load()

require('lualine').setup {
  options = {
    theme = 'onedark'
    -- ... your lualine config
  }
}
