-- Basic configuration settings
-- -----------------------------------------------
vim.opt.number       = true   -- show line numbers
vim.opt.cursorline   = true   -- highlight current line
vim.opt.hlsearch     = false  -- don't highlight search results
vim.opt.incsearch    = false  -- don't jump to search results as search string is being typed
vim.opt.wrap         = true   -- wrap long lines
vim.opt.linebreak    = true   -- break lines at words

vim.keymap.set('', '<Space>', '<NOP>')
vim.g.mapleader = " "  -- set global leader key

-- OS detection
vim.g.os_current = "Darwin"
vim.g.python3_host_prog = "/usr/local/bin/python3"


-- Load plugins with vim-plug
-- --------------------------------------------- --
local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.local/share/nvim/plugged')

Plug 'junegunn/vim-plug'
Plug 'shaunsingh/nord.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'ggandor/lightspeed.nvim'
Plug 'numToStr/Comment.nvim'
Plug 'tpope/vim-fugitive'
Plug 'akinsho/toggleterm.nvim'
Plug 'L3MON4D3/LuaSnip'

-- Filetype-specific
Plug 'lervag/vimtex'

vim.call('plug#end')
-- --------------------------------------------- --
-- End loading plugins


vim.cmd('colorscheme nord')

-- Plugin configuration
require('plugins/Comment')
require('plugins/toggleterm')
require('plugins/lualine')
require('plugins/lightspeed')
require('plugins/LuaSnip')

-- Source my spelling configurations.
require('personal/spell/my_spell')

-- BEGIN MISCELLANEOUS
-- --------------------------------------------- "
-- Easier write command
vim.keymap.set('n', '<Leader>w', '<Cmd>write<CR>')

-- Easier edit commands
vim.keymap.set('n', '<Leader>ee', ':edit ')
vim.keymap.set('n', '<Leader>es', ':split ')
vim.keymap.set('n', '<Leader>ev', ':vsplit ')

-- Easier help command
vim.keymap.set('n', '<Leader>h', ':help ')

-- Easily pull up the Git command (for use with vim-fugitive)
vim.keymap.set('n', '<Leader>g', ':Git ')

-- Rough analog of `:join` or `J` for lines above cursor
vim.keymap.set('n', 'K', 'kdd$')

-- Move current line up and down
vim.keymap.set('n', '<C-S-j>', '<Cmd>move .+1<CR>')
vim.keymap.set('n', '<C-S-k>', '<Cmd>move .-2<CR>')

-- Move selected lines up and down
vim.cmd([[
xnoremap <C-S-j> :m'>+<CR>gv=gv
xnoremap <C-S-k>  :m-2<CR>gv=gv
]])

-- Global substitute
vim.keymap.set('n', '<Leader>s', ':%s/')
vim.keymap.set('v', '<Leader>s', ':s/')

-- Search/replace current word under cursor
vim.cmd([[
nnoremap <expr> <C-s> ':%s/' . expand('<cword>') . '/'
]])

-- Use escape to return to normal mode in a Neovim terminal
vim.keymap.set('t', '<ESC>', '<C-\\><C-n>')

-- Write and quit if possible/applicable, force quit otherwise
vim.keymap.set('n', '<Leader>q',
  function()
    local success, result = pcall(vim.cmd, 'wq')
    if not success then
      vim.cmd('q!')
    end
  end,
  {desc = 'Write and quit if possible/applicable, force quit otherwise.'})

-- Save and close all buffers
vim.keymap.set('n', '<Leader>Q', '<Cmd>quitall<CR><Cmd>stopinsert<CR>')

-- Enter/leave insert mode when entering/leaving a terminal
-- You could use nvim_list_bufs
vim.cmd[[
  autocmd BufEnter term://* startinsert
  autocmd BufLeave term://* stopinsert
]]

-- END MISCELLANEOUS
