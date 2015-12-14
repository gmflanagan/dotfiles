"
" ~/.vimrc
"

set nocompatible      " prevents original vi's bugs & limitations

set ls=2              " allways show status line
set scrolloff=4       " keep 4 lines when scrolling

set t_Co=256
set term=xterm-256color
set nowrap
set tabstop=4           " how many spaces for a tab
set backspace=indent,eol,start
set autoindent
" set copyindent
set smartindent
set shiftwidth=4
set shiftround
set softtabstop=0       " disable softtab
set expandtab
set smarttab            " insert tabs at the start of the line according to shiftwidth not tabstop
set smartcase           " ignore case if search pattern is all lowercase, case-sensitive otherwise
set mouse=v
"set cursorline
set number
set shell=bash
set showmatch             " verify braces/parentheses/brackets
set matchpairs+=<:>       " Treat '<','>' as matching braces.
set visualbell t_vb=      " disable horrible beep when a command doesn't work
set ruler                 " display the curent cursor position
set foldmethod=indent
set foldnestmax=1
set showcmd
set hidden
set hlsearch
set incsearch
set backspace=2
set splitbelow
set splitright
set winminheight=1
set winheight=999
set pastetoggle=<F2>
set diffopt+=vertical
set title
set showcmd              " show incomplete commands
set autoread             " If a file is changed outside of vim, automatically reload it without asking
" set list listchars=tab:~-,precedes:>,extends:>
" set nohls                " don't highlight the last used search pattern
set nosplitbelow         " new split window is always on top

syntax on

autocmd Filetype html setlocal ts=4 sts=4 sw=4 omnifunc=htmlcomplete#CompleteTags
au FileType htmldjango set omnifunc=htmldjangocomplete#CompleteDjango
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType javascript setlocal ts=2 sts=2 sw=2 omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal ts=4 sts=4 sw=4
autocmd FileType yaml setlocal ts=2 sts=2 sw=2
autocmd FileType css setlocal ts=4 noet sw=4 omnifunc=csscomplete#CompleteCSS
autocmd FileType java set omnifunc=javacomplete#Complete
autocmd bufread *.less set ft=less
autocmd bufread *.md set ft=markdown
autocmd FileType make setlocal noexpandtab
" jump to the last position when reopening a file
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" customize the wildmenu
set wildmenu
set wildignore=*.dll,*.o,*.pyc,*.bak,*.exe
" have command-line completion <Tab> (for filenames, help topics, option names)
" first list the available options and complete the longest common part, then
" have further <Tab>s cycle through the possibilities:
set wildmode=list:longest,full

set clipboard=unnamed

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin management using vim-plug (run :PlugInstall to install)
" (ref. http://yannesposito.com/Scratch/en/blog/Vim-as-IDE/)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'davidhalter/jedi-vim', {'for': 'python'}
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'ntpeters/vim-better-whitespace'
Plug 'junegunn/vim-easy-align'
Plug 'Bling/vim-airline'
" Plug 'jiangmiao/auto-pairs'
Plug 'majutsushi/tagbar'
Plug 'jmcantrell/vim-virtualenv'

" Snippets engine.
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

Plug 'ervandew/supertab'
Plug 'kien/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'terryma/vim-multiple-cursors'
Plug 'dyng/ctrlsf.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'Valloric/MatchTagAlways'
Plug 'othree/html5.vim'
Plug 'ap/vim-css-color'
Plug 'powerman/vim-plugin-viewdoc'
Plug 'diepm/vim-rest-console'
Plug 'mjbrownie/vim-htmldjango_omnicomplete'

" Colors
"Plug 'altercation/vim-colors-solarized'
"Plug 'reedes/vim-colors-pencil'
"Plug 'tomasr/molokai'
"Plug 'romainl/Apprentice'
"Plug 'baeuml/summerfruit256.vim'
"Plug 'vim-scripts/Wombat'
"Plug 'wombat256.vim'
"Plug 'w0ng/vim-hybrid'
"Plug 'nanotech/jellybeans.vim'
"Plug 'jnurmine/Zenburn'

call plug#end()

" ----------------------------------------------
" Colour scheme
" ----------------------------------------------
syntax enable
set background=dark
colorscheme darkblossom256

let python_highlight_all = 1
let python_highlight_space_errors = 0

let g:htmldjangocomplete_html_flavour = 'html5'

if (exists('+colorcolumn'))
    set colorcolumn=120
    highlight ColorColumn ctermbg=9
endif
" airline status bar
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0

" gitgutter
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_sign_column_always = 1

" jedi-vim
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#use_splits_not_buffers = "top"
let g:jedi#goto_command = "<leader>g"
let g:jedi#goto_assignments_command = "<leader>ga"
let g:jedi#goto_definitions_command = "<leader>gd"
let g:jedi#usages_command = "<leader>h"
let g:jedi#rename_command = "<leader>r"
let g:jedi#documentation_command = "<leader>d"
let g:jedi#completions_command = "<C-Space>"


if has("unix")
    let s:uname = system("uname")
    if s:uname == "Darwin\n"
        " ctags is not Exuberant ctags on MacOS. Download from http://ctags.sourceforge.net/; then
        " ./configure && make && sudo make install
        let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
    endif
endif

" close vim if only widow left open is a NERDTree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keyboard mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=","

nnoremap ; :
vnoremap ; :
nnoremap H ^
nnoremap L $
inoremap jk <Esc>
inoremap JK <Esc>

" move between split panes
nnoremap <S-M-Down> <C-w>j<C-w>_
nnoremap <S-M-Up> <C-w>k<C-w>_
nnoremap <S-M-Left> <C-w>h<C-w>_
nnoremap <S-M-Right> <C-w>l<C-w>_
nnoremap <C-h> <C-w>h<C-w>_
nnoremap <C-j> <C-w>j<C-w>_
nnoremap <C-k> <C-w>k<C-w>_
nnoremap <C-l> <C-w>l<C-w>_

" toggle NERDTree
nnoremap <leader>t :NERDTreeToggle<cr>

" toggle Tag Browser
nnoremap <leader>b :TagbarToggle<CR>

" shell command prompt
nnoremap <leader>x :!

" run the current file as a python script
nnoremap <leader>p :!python %<CR>

" Removes highlight of your last search
nnoremap  <leader><space>  :nohl<CR>
vnoremap  <leader><space>  :nohl<CR>

" save current file alternative
nnoremap  <leader>w :w<CR>

" Save all open files and exit
nnoremap  <leader>qq :wqa<CR>
vnoremap  <leader>qq :wqa<CR>
inoremap  <leader>qq <Esc>:wqa<CR>

" undo in insert mode
inoremap  <leader><leader> <Esc>ua
nnoremap  <leader><leader> u
vnoremap  <leader><leader> u

" ----------------------------------------------
" CtrlSF - code search
" ----------------------------------------------
" search the word under the cursor in all files in the current project
nmap     <leader>f :CtrlSF <c-r>=expand("<cword>")<cr><cr><C-w>_
vmap     <leader>f <Plug>CtrlSFVwordPath
nmap     <leader>s <Plug>CtrlSFPrompt
nnoremap <leader>ss :CtrlSFToggle<CR>

" ----------------------------------------------
" CtrlP - fuzzy file finder
" ----------------------------------------------
nnoremap <leader>/ :CtrlP

" ----------------------------------------------
" Git
" ----------------------------------------------
map gd :Gdiff<CR>
map gb :Gblame<CR>

" ultisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger = "<tab>"
"let g:UltiSnipsJumpForwardTrigger = "<S-C-n>"
"let g:UltiSnipsJumpBackwardTrigger = "<S-C-p>"

:nnoremap <Tab> :bnext<CR>
:nnoremap <S-Tab> :bprevious<CR>

