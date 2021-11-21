" PLUGINS
call plug#begin()
"Plug 'dracula/vim'
Plug 'habamax/vim-habanight'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" LEADER
let mapleader="\<space>"

" INIT VIM
nnoremap <leader>rc :tabe ~/.config/nvim/init.vim<CR>
nnoremap <leader>src :source $MYVIMRC<CR>

" DISPLAY
set relativenumber                  " relative line numbers
set cursorline                      " highlight cursor line
"set cc=90                          " mark column 90
set showmatch                       " mark matching scope characters
set signcolumn=number

" SCROLLING
set scrolloff=16                     " vertical scroll padding
set sidescrolloff=4                 " horizontal scroll padding
set nostartofline                   " keep the cursor at the current column when moving

" LINE BREAK
set wrap
set linebreak

" REMOVE TRAILING WHITESPACE ON :w
"autocmd * BufWritePre :%s/\s\+$//e

" INDENTATION
set tabstop=4                       " tabs are 4 spaces
set softtabstop=4                   "
set shiftwidth=4                    " shift by 4 spaces
set expandtab                       " expand tabs to spaces
set autoindent                      " indent without filetype rules
set shiftround                      " round indent to shiftwidth
"set nojoinspaces                   " for J, investigate

" CUT AND PASTE
set clipboard=unnamed               " use system clipboard

" MOUSE
set mouse=a

" SEARCH
set ignorecase                      " ignore case in search patterns
set incsearch                       " incrementally match the search
set smartcase                       " overrides 'ignorecase' if search pattern contains an upper char
set showmatch                       " highlight search matches while typing

" COLORS
colorscheme habanight

" MOVE LINE OR BLOCK
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" TABS
nnoremap <S-h> gT                   " switch tabs
nnoremap <S-l> gt
nnoremap <S-Left>  :tabmove -1<CR>  " move tabs
nnoremap <S-Right> :tabmove +1<CR>

" COC
" CR confirms completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Tab to navigate completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" MISC
nnoremap Y y$                       " make Y behave like D
set updatetime=300









































