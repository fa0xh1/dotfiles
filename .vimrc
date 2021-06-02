syntax on
set nocompatible
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
let g:airline_theme = 'miramare'
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-vinegar' 
Plugin 'scrooloose/nerdtree'
Plugin 'sheerun/vim-polyglot'
Plugin 'franbach/miramare'
Plugin 'qpkorr/vim-bufkill'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ervandew/supertab'
Plugin 'rking/ag.vim'
Plugin 'skwp/greplace.vim'
Plugin 'airblade/vim-gitgutter'

call vundle#end()

let mapleader=","
let NERDTreeHijackNetrw=0
let g:airline#extensions#tabline#enabled=1
"   let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme = 'miramare'
let g:grep_cmd_opts = '--line-numbers --noheading'
set termguicolors
set number
set expandtab
set shiftwidth=2
set tabstop=2
set hlsearch
set laststatus=2
set grepprg=ag
filetype plugin indent on
autocmd Filetype php,py setlocal shiftwidth=4 tabstop=4
nmap <Leader>c :source $MYVIMRC<cr>
nmap <Leader>n :bn<cr>
nmap <Leader>b :bp<cr>
nmap <Leader>x :BD<cr>
nmap <Leader>s :w<cr>
nmap <Leader>q :q<cr>
nmap <Leader>Q :q!<cr>
nmap <Leader>S :w !sudo tee %<cr> 
nmap <Leader><space> :nohlsearch<cr>
nmap <Leader>f :NERDTreeToggle<cr>
nmap <Leader>o :NERDTreeFind<cr>
"    nmap <Leader>g <C-]>
nmap <C-h> <C-w><C-h>
nmap <C-j> <C-w><C-j>
nmap <C-k> <C-w><C-k>
nmap <C-l> <C-w><C-l>

colorscheme miramare
