-- Plugins
require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use {
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- TreeSitter
  -- use 'nvim-treesitter/nvim-treesitter'
 
  -- Colorschemes
  use 'morhetz/gruvbox'
  use 'arcticicestudio/nord-vim'

  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'

  -- Utils
  use 'vimwiki/vimwiki'
  use 'tpope/vim-fugitive'
end)

-- No swap file
vim.bo.swapfile = false

-- Cursor
vim.o.guicursor = ""

-- Hide the mode since we are using Airline
vim.o.showmode = false

-- Line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Indentation
vim.bo.expandtab = true
vim.bo.smartindent = true
vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4
vim.wo.linebreak = true

-- Searching
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- Splitting
vim.o.splitbelow = true
vim.o.splitright = true

-- Background
vim.o.background = "dark"
vim.o.termguicolors = true

-- Colorscheme
vim.cmd [[
try
  colorscheme nord
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]

-- Airline
vim.cmd [[
try
  let g:airline_theme='nord'
  let g:airline_powerline_fonts = 1
  let g:nord#extensions#tabline#enabled = 1
catch
endtry
]]

-- Treesitter
-- local configs = require'nvim-treesitter.configs'
-- configs.setup {
--   ensure_installed = "maintained", -- Only use parsers that are maintained
--   highlight = { -- enable highlighting
--     enable = true,
--   },
--   indent = {
--     enable = false, -- default is disabled anyways
--   }
-- }

-- VimWiki
vim.cmd [[
try
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
catch
endtry
]]

-- KEYMAPPINGS
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }

-- Set leader key to space
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Ctrl + s to save
keymap('n', '<c-s>', ':w<CR>', {})
keymap('i', '<c-s>', '<Esc>:w<CR>a', {})

-- Moving between splits
keymap('n', '<c-j>', '<c-w>j', opts)
keymap('n', '<c-k>', '<c-w>k', opts)
keymap('n', '<c-h>', '<c-w>h', opts)
keymap('n', '<c-l>', '<c-w>l', opts)

-- Exit with q
keymap('n', '<leader>q', ':q<CR>', { silent = true })

-- Make espace do nothing when in insert mode
keymap("i", "<Esc>", "<Nop>", opts)

-- Use jj instead of espace to exit normal mode
keymap('i', 'jj', '<Esc>', opts)

-- Splitting keymaps
keymap('n', '<leader>v', ':vsplit<space>', {})
keymap('n', '<leader>h', ':split<space>', {})

-- Resize splits
keymap('n', '<up>', '<c-w>+', opts)
keymap('n', '<down>', '<c-w>-', opts)
keymap('n', '<left>', '3<c-w><', opts)
keymap('n', '<right>', '3<c-w>>', opts)

-- Hide search results
keymap('n', '<leader>n', ':nohl<CR>', { silent = true })

-- Telescope
keymap('n', '<leader>f', '<cmd>:lua require("telescope.builtin").find_files()<cr>', opts)
keymap('n', '<leader>g', '<cmd>:lua require("telescope.builtin").live_grep()<cr>', opts)
keymap('n', '<leader>b', '<cmd>:lua require("telescope.builtin").buffers()<cr>', opts)
keymap('n', '<leader>h', '<cmd>:lua require("telescope.builtin").help_tags()<cr>', opts)
