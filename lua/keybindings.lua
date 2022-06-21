vim.g.mapleader = " "
vim.g.maplocalleader = " "
local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

-- 上下滚动------------------------------------------------------
--- ctrl u / ctrl + d  只移动9行，默认移动半屏
map("n", "<C-u>", "10k", opt)
map("n", "<C-d>", "10j", opt)

-- visual模式下缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)

-- magic search
map("n", "/", "/\\v", { noremap = true , silent = false})
map("v", "/", "/\\v", { noremap = true , silent = false})

-- alt + hjkl  窗口之间跳转
map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)

-- windows 分屏快捷键
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)

-- nvim-tree ----------------------------------------------------
map('n', '<A-m>', ':NvimTreeToggle<CR>', opt)

-- treesitter ---------------------------------------------------
-- nvim-treesitter 代码格式化
map("n", "<leader>i", "gg=G", opt)

-- bufferline ---------------------------------------------------
-- 左右Tab切换
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
-- 关闭左/右侧标签页
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
-- 关闭其他标签页
map("n", "<leader>bo", ":BufferLineCloseRight<CR>:BufferLineCloseLeft<CR>", opt)
-- 关闭选中标签页
map("n", "<leader>bp", ":BufferLinePickClose<CR>", opt)

-- telescope ---------------------------------------------------
map("n", "<leader>ff", ":Telescope find_files<CR>", opt)
map("n", "<leader>fg", ":Telescope live_grep<CR>", opt)
map("n", "<leader>fb", ":Telescope buffers<CR>", opt)
map("n", "<leader>fh", ":Telescope help_tags<CR>", opt)

-- vimspector ---------------------------------------------------
vim.g.vimspector_enable_mappings = "HUMAN"

-- lspsaga ------------------------------------------------------
map("n", "gh", ":Lspsaga lsp_finder<CR>", opt)
map("n", "<leader>ca", ":Lspsaga code_action<CR>", opt)
map("v", "<leader>cc", ":<C-U>Lspsaga range_code_action<CR>", opt)
map("n", "K", ":Lspsaga hover_doc<CR>", opt)
map("n", "<C-f>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", opt)
map("n", "<C-b>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", opt)
map("n", "gs", ":Lspsaga signature_help<CR>", opt)
map("n", "gr", ":Lspsaga rename<CR>", opt)
map("n", "gd", ":Lspsaga preview_definition<CR>", opt)
map("n", "<leader>cd", ":Lspsaga show_line_diagnostics<CR>", opt)
map("n", "<leader>cc", "<cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>", opt)
map("n", "[e", ":Lspsaga diagnostic_jump_next<CR>", opt)
map("n", "]e", ":Lspsaga diagnostic_jump_prev<CR>", opt)
-- toggleterm ---------------------------------------------------
local pluginKeys = {}
-- 自定义 toggleterm 3个不同类型的命令行窗口
-- <leader>ta 浮动
-- <leader>tb 右侧
-- <leader>tc 下方
-- 特殊lazygit 窗口，需要安装lazygit
-- <leader>tg lazygit
pluginKeys.mapToggleTerm = function(toggleterm)
  vim.keymap.set({ "n", "t" }, "<leader>ta", toggleterm.toggleA)
  vim.keymap.set({ "n", "t" }, "<leader>tb", toggleterm.toggleB)
  vim.keymap.set({ "n", "t" }, "<leader>tc", toggleterm.toggleC)
  vim.keymap.set({ "n", "t" }, "<leader>tg", toggleterm.toggleG)
end

return pluginKeys
