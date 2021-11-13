call plug#begin('~/AppData/Local/nvim/plugged')
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" Colorscheme
colorscheme dracula
let g:airline_theme='dracula'
let g:dracula_italic = 0

" Airline config
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" General settings
set guicursor=

set laststatus=2
"set t_Co=256

set bs=indent,eol,start                              " allow backspacing over everything in insert mode
set viminfo='20,\"50                                 " read/write a .viminfo file, don't store more
set history=50                                       " keep 50 lines of command line history
set ruler                                            " show the cursor position all the time
set noshowmode                                       " remove the mode indicator at the bottom
set clipboard=unnamedplus                            " clipboard
set autoread

set completeopt=longest,menu                         " improve completion popup menu
set omnifunc=syntaxcomplete#Complete                 " omni complete

set number                                           " setting line numbers
set relativenumber                                   " use relative numbers

set tabstop=4                                        " tabs are at proper location
set expandtab                                        " don't use actual tab character
set shiftwidth=4                                     " indenting is 4 spaces
set autoindent                                         " turn on audoindent
set linebreak                                        " soft wrapping

set incsearch                                        " incremental search
set ignorecase                                       " case insensitivity when searching
set smartcase                                        " smartcase when searching
set spelllang=en,sv                                  " spell checking languages

" Fixing how Vim splits new windows
set splitbelow splitright

" Set colorscheme
set background=dark
set termguicolors

" --- Keybindings ---

" Set leader key to space
let mapleader =" "

" Save changes
map <leader>s :w<CR>

" Quit
map <leader>q :q<CR>

" Write & quit
map <leader>x :x<CR>

" Make jj do esc when in insert mode
inoremap jj <Esc>

" Make esc do nothing when in insert mode
inoremap <Esc> <Nop>

" Make space do nothing when in normal mode
nnoremap <Space> <Nop>

" Text search in normal mode
map <leader>f /

" Seach & replace word under cursor
nnoremap <Leader>r :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>

" Turn off text search highlighting
map <silent> <leader>n :noh<CR>

" Create splits
map <leader>v :vsplit<space>
map <leader>h :split<space>

" Split navigation fix
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Resize splits
noremap <up> <C-W>+
noremap <down> <C-W>-
noremap <left> 3<C-W><
noremap <right> 3<C-W>>

" Popup completion menu fixes
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

