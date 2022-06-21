require("nvim-tree").setup()
require('lualine').setup{
    options = { theme = 'dracula' },
}
vim.opt.termguicolors = true
require("bufferline").setup{}
require("which-key").setup{}
require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
}
require("nvim-autopairs").setup {}
