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
    -- Theme
    Plug('navarasu/onedark.nvim')
    -- HexColor Highlighting
    Plug('norcalli/nvim-colorizer.lua')
    -- manage language servers
    Plug('nvim-treesitter/nvim-treesitter')
    --allow icons 
    Plug ('nvim-tree/nvim-web-devicons')
    --nvim file explorer
    Plug('nvim-tree/nvim-tree.lua')
vim.call('plug#end')

require('colorizer').setup()

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

--lualine config
require('lualine').setup {
  options = {
    theme = 'onedark'
    -- ... your lualine config
  }
}

-- treesitter config
require('nvim-treesitter').install { 
    'javascript',
    'python',
    'sql',
    'html',
    'css',
    'lua'
}

--devicons config
require('nvim-web-devicons').setup{
    color_icons = true;
    default = true;
    strict = true;
}

-- tree explorer config
function toggleTree()
    require("nvim-tree.api").tree.toggle({ focus = true })
end

vim.keymap.set("n", "<C-t>", toggleTree, { desc = "Toggle nvim-tree" })

local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
      return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.map.on_attach.default(bufnr)
    -- remove existing mapping
    vim.keymap.del("n", "<C-t>", { buffer = bufnr })
    --custom mappings
    vim.keymap.set("n", "<C-t>", toggleTree, { desc = "Toggle nvim-tree" })
end 

require('nvim-tree').setup{
    on_attach = my_on_attach
}

