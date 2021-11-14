let g:ale_disable_lsp = 1

call plug#begin('~/AppData/Local/nvim/plugged')
" Themes and status bar
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'

" Utils
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'junegunn/goyo.vim'
Plug 'mattn/emmet-vim'
Plug 'raimondi/delimitmate'
" Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
call plug#end()

" Colorscheme
colorscheme dracula
let g:airline_theme='dracula'
let g:dracula_italic = 0

" Airline config
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" ALE
let g:airline#extensions#ale#enabled = 1

" NERDTree	
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let nerdtree_tabs_open_on_console_startup = 2

" Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" General settings
set guicursor=

set laststatus=2
set t_Co=256

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
map <silent> <leader>q :q<CR>

" Write & quit
map <leader>x :x<CR>

" Make jj do esc when in insert mode
inoremap jj <Esc>

" Make esc do nothing when in insert mode
inoremap <Esc> <Nop>

" Make space do nothing when in normal mode
nnoremap <Space> <Nop>

" Goyo
map <silent> <leader>g :Goyo<CR>

" Spell checking
map <silent> <leader>o :set spell!<CR>

" Text search in normal mode
map <leader>f /

" Seach & replace word under cursor
nnoremap <Leader>r :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>

" Turn off text search highlighting
map <silent> <leader>n :nohl<CR>

" Nerdtree toggling
map <silent><Leader>t <plug>NERDTreeTabsToggle<CR>
map <silent> <leader>tf :NERDTreeFocus<CR>

" Change tabs
map <silent><Leader>j :tabn<CR>
map <silent><Leader>ö :tabp<CR>

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

" --- Coc ---

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" --- Coc snippets ---

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Omnisharp ---

" augroup omnisharp_commands
"   autocmd!

"   " Show type information automatically when the cursor stops moving.
"   " Note that the type is echoed to the Vim command line, and will overwrite
"   " any other messages in this space including e.g. ALE linting messages.
"   " autocmd CursorHold *.cs OmniSharpTypeLookup

"   " The following commands are contextual, based on the cursor position.
"   autocmd FileType cs nmap <silent> <buffer> gd <Plug>(omnisharp_go_to_definition)
"   autocmd FileType cs nmap <silent> <buffer> <Leader>osfu <Plug>(omnisharp_find_usages)
"   autocmd FileType cs nmap <silent> <buffer> <Leader>osfi <Plug>(omnisharp_find_implementations)
"   autocmd FileType cs nmap <silent> <buffer> <Leader>ospd <Plug>(omnisharp_preview_definition)
"   autocmd FileType cs nmap <silent> <buffer> <Leader>ospi <Plug>(omnisharp_preview_implementations)
"   autocmd FileType cs nmap <silent> <buffer> <Leader>ost <Plug>(omnisharp_type_lookup)
"   autocmd FileType cs nmap <silent> <buffer> <Leader>osd <Plug>(omnisharp_documentation)
"   autocmd FileType cs nmap <silent> <buffer> <Leader>osfs <Plug>(omnisharp_find_symbol)
"   autocmd FileType cs nmap <silent> <buffer> <Leader>osfx <Plug>(omnisharp_fix_usings)
"   autocmd FileType cs nmap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)
"   autocmd FileType cs imap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)

"   " Navigate up and down by method/property/field
"   autocmd FileType cs nmap <silent> <buffer> [[ <Plug>(omnisharp_navigate_up)
"   autocmd FileType cs nmap <silent> <buffer> ]] <Plug>(omnisharp_navigate_down)
"   " Find all code errors/warnings for the current solution and populate the quickfix window
"   autocmd FileType cs nmap <silent> <buffer> <Leader>osgcc <Plug>(omnisharp_global_code_check)
"   " Contextual code actions (uses fzf, vim-clap, CtrlP or unite.vim selector when available)
"   autocmd FileType cs nmap <silent> <buffer> <Leader>osca <Plug>(omnisharp_code_actions)
"   autocmd FileType cs xmap <silent> <buffer> <Leader>osca <Plug>(omnisharp_code_actions)
"   " Repeat the last code action performed (does not use a selector)
"   autocmd FileType cs nmap <silent> <buffer> <Leader>os. <Plug>(omnisharp_code_action_repeat)
"   autocmd FileType cs xmap <silent> <buffer> <Leader>os. <Plug>(omnisharp_code_action_repeat)

"   autocmd FileType cs nmap <silent> <buffer> <Leader>os= <Plug>(omnisharp_code_format)

"   autocmd FileType cs nmap <silent> <buffer> <Leader>osnm <Plug>(omnisharp_rename)

"   autocmd FileType cs nmap <silent> <buffer> <Leader>osre <Plug>(omnisharp_restart_server)
"   autocmd FileType cs nmap <silent> <buffer> <Leader>osst <Plug>(omnisharp_start_server)
"   autocmd FileType cs nmap <silent> <buffer> <Leader>ossp <Plug>(omnisharp_stop_server)
" augroup END

