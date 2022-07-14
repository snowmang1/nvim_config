-- Evan Drake neovim config

-- required files
require('plugins')
require('plugin_config')
require('autocmds')

-- custom filetype command
vim.cmd [[ autocmd BufRead,BufNewFile *.org set filetype=org ]]

-- options
local o = vim.o		-- global
local wo = vim.wo	-- window local
-- local bo = vim.bo	-- buffer local

-- window local
wo.number = true
o.cursorline = true

-- keymaps
local map = vim.api.nvim_set_keymap
	-- window nav
	local nore_opts = { noremap = true, silent = true }
map('n', '<c-h>', '<c-w>h', nore_opts)
map('n', '<c-j>', '<c-w>j', nore_opts)
map('n', '<c-k>', '<c-w>k', nore_opts)
map('n', '<c-l>', '<c-w>l', nore_opts)
map('t', '<c-h>', '<c-\\><c-n><c-w>h', {silent = true})
map('t', '<c-j>', '<c-\\><c-n><c-w>j', {silent = true})
map('t', '<c-k>', '<c-\\><c-n><c-w>k', {silent = true})
map('t', '<c-l>', '<c-\\><c-n><c-w>l', {silent = true})

	-- couple completion
map('i', '(', '()<Left>', {silent = true})
map('i', '[', '[]<Left>', {silent = true})
map('i', '{', '{}<Left>', {silent = true})

	-- terminal mappings
map('t', '<esc>', '<c-\\><c-n>', {silent = true})

	-- custom keymaps
map('n', '<c-n>', ':NvimTreeToggle<CR>', nore_opts)
map('i', '<C-d>', '<esc>yypA', {silent = true})
map('n', '<C-p>', ':HopWord<CR>', nore_opts)
