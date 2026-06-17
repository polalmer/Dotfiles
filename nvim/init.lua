local vim = vim

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- random shortcuts
vim.keymap.set("n", "<C-e>", vim.diagnostic.open_float)

--Plugins
vim.pack.add({
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/nvim-lualine/lualine.nvim',
})


--lualine config
vim.cmd.colorscheme("midnightX")
require("lualine").setup({
    options = {
        theme = midnight_x_lualine_theme,
        section_separators = "",
        component_separators = "",
    }
})
