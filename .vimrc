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
Plugin 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plugin 'tpope/vim-projectionist'       
Plugin 'noahfrederick/vim-composer'
Plugin 'noahfrederick/vim-laravel'

call vundle#end()

filetype plugin indent on
autocmd Filetype php,py setlocal shiftwidth=4 tabstop=4
let mapleader=","
let NERDTreeHijackNetrw = 0
let g:airline#extensions#tabline#enabled = 1
"   let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme = 'miramare'
let g:grep_cmd_opts = '--line-numbers --noheading'
" Go syntax highlighting
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1

" Auto formatting and importing
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

" Status line types/signatures
let g:go_auto_type_info = 1

" Run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" Map keys for most used commands.
" Ex: `\b` for building, `\r` for running and `\b` for running test.
autocmd FileType go nmap <C-g>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <C-g>r  <Plug>(go-run)
autocmd FileType go nmap <C-g>t  <Plug>(go-test)
au filetype go inoremap <buffer> . .<C-x><C-o>

set autowrite
set termguicolors
set number
set expandtab
set shiftwidth=2
set tabstop=2
set hlsearch
set laststatus=2
set grepprg=ag
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
