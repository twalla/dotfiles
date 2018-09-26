" ===================
" PLUGIN INSTALLATION
" ===================

" Install vim-plug if not already installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'w0rp/ale'
Plug 'c9s/vikube.vim'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'edkolev/promptline.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'google/vim-jsonnet'
Plug 'wincent/command-t'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf'
Plug 'Alok/notational-fzf-vim'
call plug#end()

" ====================
" PLUGIN CONFIGURATION
" ====================

" NERDTree
let NERDTreeShowHidden=1

" vim-airline
let g:airline_powerline_fonts=1

" notational-fzf-vim
<<<<<<< HEAD
let g:nv_search_paths = ['~/notes', './doc', './notes']
=======
let g:nv_search_paths = ['~/scratch', '~/notes', '~/repos']
>>>>>>> bd4be78ef5887d1e2a4610af44adcb1343494af5

" ==================
" COLORS AND THEMING
" ==================

" Set vim theme
set background=dark
colorscheme solarized
let g:solarized_termtrans=1

" Airline theme
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'


" edkolev/promptline config
let g:promptline_theme='airline'
let g:promptline_preset = {
  \'a'  : [ promptline#slices#cwd() ],
  \'b'  : [ promptline#slices#vcs_branch() ],
  \'x'  : [ '$(prompt_k8s_context)'],
  \'y'  : [ promptline#slices#python_virtualenv() ],
  \'warn'  : [ promptline#slices#last_exit_code() ]}

" edkolev/tmuxline config

" Mirror airline theme in tmux
let g:tmuxline_theme='airline'

" =================
" VIM CONFIGURATION
" =================

" Set line numbers
set number
" Prevent formatting fuckups when pasting multi-line content
set paste
" More natural split opening
set splitbelow
set splitright
" Make Vim more useful
set nocompatible
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
  set undodir=~/.vim/undo
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
" Make tabs as wide as two spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd

" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif