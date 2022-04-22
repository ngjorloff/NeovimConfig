-- Plugins
require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  -- Git
  use 'tpope/vim-fugitive'

  -- Telescope
  use {
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- TreeSitter
  use 'nvim-treesitter/nvim-treesitter'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  -- Snippets
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- Colorschemes
  use 'morhetz/gruvbox'
  use 'arcticicestudio/nord-vim'

  -- Airline
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
end)

-- No swap file
vim.bo.swapfile = false

-- Cursor
vim.o.guicursor = ""

-- Hide the mode since we are using Airline
vim.o.showmode = false

-- Use one universal statusline
vim.o.laststatus = 3

-- Only highlight the line in current buffer
vim.opt.cursorline = true
local group = vim.api.nvim_create_augroup("CursorLineControl", { clear = true })
local set_cursorline = function(event, value, pattern)
  vim.api.nvim_create_autocmd(event, {
    group = group,
    pattern = pattern,
    callback = function()
      vim.opt_local.cursorline = value
    end,
  })
end
set_cursorline("WinLeave", false)
set_cursorline("WinEnter", true)
set_cursorline("FileType", false, "TelescopePrompt")

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
local configs = require'nvim-treesitter.configs'
configs.setup {
  ensure_installed = { "bash", "c_sharp", "css", "go", "html", "json", "lua", "python", "javascript" },
  highlight = { -- enable highlighting
    enable = true,
  },
  indent = {
    enable = false, -- default is disabled anyways
  }
}

-- nvim-cmp.
local cmp = require'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  window = {
    --completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer', keyword_length = 5 }
  })
})

-- Setup lspconfig
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
--require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
--  capabilities = capabilities
--}

-- C# lsp installed by running `dotnet tool install --global csharp-ls`, does not seem to work
--require'lspconfig'.csharp_ls.setup{
--    capabilities = capabilities,
--}

-- KEYMAPPINGS
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }
local silent = { silent = true }

-- Set leader key to space
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Ctrl + s to save
keymap('n', '<c-s>', ':w<CR>', {})
keymap('i', '<c-s>', '<Esc>:w<CR>a', {})

-- Exit with q
keymap('n', '<leader>q', ':q<CR>', silent)

-- Make escape do nothing when in insert mode
keymap("i", "<Esc>", "<Nop>", opts)

-- Use jj instead of escape to exit normal mode
keymap('i', 'jj', '<Esc>', opts)

-- Creating splits
keymap('n', '<leader>v', ':vsplit<space>', {})
keymap('n', '<leader>h', ':split<space>', {})

-- Moving between splits
keymap('n', '<c-j>', '<c-w>j', opts)
keymap('n', '<c-k>', '<c-w>k', opts)
keymap('n', '<c-h>', '<c-w>h', opts)
keymap('n', '<c-l>', '<c-w>l', opts)

-- Resize splits
keymap('n', '<up>', '<c-w>+', opts)
keymap('n', '<down>', '<c-w>-', opts)
keymap('n', '<left>', '3<c-w><', opts)
keymap('n', '<right>', '3<c-w>>', opts)

-- Hide search results
keymap('n', '<leader>n', ':nohl<CR>', silent)

-- Telescope
keymap('n', '<leader>f', '<cmd>:lua require("telescope.builtin").find_files()<cr>', opts)
keymap('n', '<leader>g', '<cmd>:lua require("telescope.builtin").live_grep()<cr>', opts)
keymap('n', '<leader>b', '<cmd>:lua require("telescope.builtin").buffers()<cr>', opts)
keymap('n', '<leader>h', '<cmd>:lua require("telescope.builtin").help_tags()<cr>', opts)
