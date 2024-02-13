set fileformat=unix
set number
set relativenumber
set noswapfile
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set cindent
set autoindent
set cc=80
set enc=utf-8
set t_Co=256
set cursorline
set spell
set visualbell
set clipboard=unnamedplus,unnamed
set display=lastline
set belloff=all
syntax on
filetype plugin indent on
set backspace=indent,eol,start  " more powerful backspacing
let mapleader = ','


let is_win = has('win64') 
let data_dir = is_win ? '~/vimfiles' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif



call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons'
Plug 'lervag/vimtex'
Plug 'jiangmiao/auto-pairs'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-surround'
Plug 'fatih/vim-go'
Plug 'junegunn/fzf'

call plug#end()

let g:coc_global_extensions = ["coc-clangd", "coc-pyright", "coc-json", "coc-html", "coc-html-css-support", "coc-go"]
let g:go_def_mapping_enabled = 0

color habamax
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1

" use <tab> to trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

inoremap <c-b> <Esc>:NERDTreeToggle<cr>
nnoremap <c-b> <Esc>:NERDTreeToggle<cr>

nnoremap <leader>bn :bnext<CR> " Switch to the next buffer
nnoremap <leader>bp :bprevious<CR> " Switch to the previous buffer

autocmd FileType python nmap <buffer> <F9> :w<CR>:exec '!python' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python' shellescape(@%, 1)<CR>

autocmd FileType go nmap <buffer> <F9> :w <CR>:GoRun <CR>
autocmd FileType go imap <buffer> <F9> <esc>:w <CR>:GoRun <CR>

nmap <F8> :TagbarToggle<CR>
