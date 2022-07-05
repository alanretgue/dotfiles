set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'vim-airline/vim-airline'
  Plugin 'preservim/nerdtree'
  Plugin 'chrisbra/Colorizer'
  Plugin 'gmarik/Vundle.vim'
  Plugin 'frazrepo/vim-rainbow'
  Plugin 'preservim/nerdcommenter'
call vundle#end()

let g:airline_powerline_fonts = 1

nnoremap <C-n> :NERDTree<CR>

set autoindent
set expandtab
set shiftwidth=4
set smartindent
set smarttab
set softtabstop=4

set rnu nu

set so=10

set textwidth=80
set showmatch
syntax on
filetype plugin indent on
set list

set listchars=eol:$,trail:·

set wildmenu

set colorcolumn=+1

colorscheme desert

set incsearch
set hlsearch

set statusline=%.40F%=%m\ %Y\ Line:\ %3l/%L[%3p%%]

" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

let g:neovide_transparency=0.8
