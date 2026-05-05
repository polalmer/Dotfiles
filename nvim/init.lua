local vim = vim
local Plug = vim.fn['plug#']

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- Copy yanks to system clipboard, but keep delete/change local.
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        local e = vim.v.event
        if e.operator == "y" and e.regname == "" then
            vim.fn.setreg("+", e.regcontents, e.regtype)
        end
    end,
})

--Plug Area
vim.call('plug#begin')
    -- BottomInfobar
    Plug('nvim-lualine/lualine.nvim')
    Plug('neovim/nvim-lspconfig')
vim.call('plug#end')

vim.lsp.enable('pyright')

--lualine config
vim.cmd.colorscheme("midnightX")
require("lualine").setup({
    options = {
        theme = midnight_x_lualine_theme,
        section_separators = "",
        component_separators = "",
    }
})
