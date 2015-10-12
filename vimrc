"
" ~/.vimrc
"

set nocompatible  	" prevents original vi's bugs & limitations

set ls=2          	" allways show status line
"set tw=100		    " textwidth : 100 chars
set scrolloff=4   	" keep 4 lines when scrolling

set t_Co=256
"set term=xterm-256color
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set mouse=v
"set cursorline
set showmatch 		    " verify brace/parenthes/bracket
set matchpairs+=<:>     " Treat '<','>' as matching braces.
set visualbell t_vb=    " disable horrible beep when a command doesn't work
set ruler 	            " display the curent cursor position
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
set clipboard=unnamedplus
set pastetoggle=<F2>
set diffopt+=vertical

syntax on

autocmd Filetype html setlocal ts=4 sts=4 sw=4 omnifunc=htmlcomplete#CompleteTags
au FileType htmldjango set omnifunc=htmldjangocomplete#CompleteDjango
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType javascript setlocal ts=4 sts=4 sw=4 omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal ts=4 sts=4 sw=4
autocmd FileType yaml setlocal ts=2 sts=2 sw=2
autocmd FileType css setlocal ts=4 noet sw=4 omnifunc=csscomplete#CompleteCSS
autocmd FileType java set omnifunc=javacomplete#Complete
autocmd bufread *.less set ft=less
autocmd bufread *.md set ft=markdown
autocmd FileType make setlocal noexpandtab
" jump to the last position when reopening a file
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

let g:htmldjangocomplete_html_flavour = 'html5'

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
Plug 'bronson/vim-trailing-whitespace'
Plug 'junegunn/vim-easy-align'
Plug 'Bling/vim-airline'
"Plug 'jiangmiao/auto-pairs'
Plug 'ervandew/supertab'
Plug 'majutsushi/tagbar'

" Snippets engine.
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

Plug 'kien/ctrlp.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'dyng/ctrlsf.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'Valloric/MatchTagAlways'
Plug 'othree/html5.vim'
Plug 'ap/vim-css-color'
Plug 'powerman/vim-plugin-viewdoc'
Plug 'diepm/vim-rest-console'
Plug 'mjbrownie/vim-htmldjango_omnicomplete'

" Unite code search
"   depends on vimproc
" Plug 'Shougo/vimproc.vim', {'do': 'make'}
" Plug 'Shougo/unite.vim'
" Plug 'rking/ag.vim' "apt-get install silversearcher-ag / brew install the_silver_searcher

" Colors
"Plug 'altercation/vim-colors-solarized'
"Plug 'sickill/vim-monokai'
Plug 'tomasr/molokai'
Plug 'romainl/Apprentice'
Plug 'vim-scripts/Wombat'
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
colorscheme molokai

"let g:molokai_original = 1
"let g:jellybeans_use_lowcolor_black = 0

if (exists('+colorcolumn'))
    set colorcolumn=120
    highlight ColorColumn ctermbg=9
endif
" airline status bar
"let g:airline#extensions#tabline#enabled = 1

" jedi-vim
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#use_splits_not_buffers = "top"
let g:jedi#goto_command = "<leader>g"
let g:jedi#goto_assignments_command = ""
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"

" unite search
let g:unite_source_history_yank_enable = 1
try
  let g:unite_source_rec_async_command='ag --nocolor --nogroup -g ""'
  call unite#filters#matcher_default#use(['matcher_fuzzy'])
catch
endtry

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
nnoremap ; :

let mapleader=","
" move between split panes
map <S-M-Down> <C-w>j<C-w>_
map <S-M-Up> <C-w>k<C-w>_
map <C-h> <C-w>h<C-w>_
map <C-j> <C-w>j<C-w>_
map <C-k> <C-w>k<C-w>_
map <C-l> <C-w>l<C-w>_

" toggle NERDTree
nnoremap <leader>t :NERDTreeToggle<cr>
" toggle Tag Browser
nmap <leader>b :TagbarToggle<CR>

" search a file in the filetree
" nnoremap <space><space> :split<cr> :<C-u>Unite -start-insert file_rec/async<cr>
" nnoremap <leader><space> :<C-u>Unite -start-insert file_rec/async<cr>
" reset - note it is <C-l> normally
" nnoremap <space>r <Plug>(unite_restart)

" search the word under the cursor in all files in the current dir
nmap <leader>f :Ag <c-r>=expand("<cword>")<cr><cr><C-w>_
nnoremap <space>/ :Ag<space>

" Removes highlight of your last search
noremap <leader>q :nohl<CR>
vnoremap <leader>q :nohl<CR>
inoremap <leader>q :nohl<CR>

" ----------------------------------------------
" CtrlSF - code search
" ----------------------------------------------
nmap     <leader>f :CtrlSF <c-r>=expand("<cword>")<cr><cr><C-w>_
nmap     <leader><leader> <Plug>CtrlSFPrompt
vmap     <leader>f <Plug>CtrlSFVwordPath
nnoremap <leader><space> :CtrlSFToggle<CR>
inoremap <leader><space> <Esc>:CtrlSFToggle<CR>

" ----------------------------------------------
" Git
" ----------------------------------------------
map gd :Gdiff<CR>
map gb :Gblame<CR>

