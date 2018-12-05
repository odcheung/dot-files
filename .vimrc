set nocompatible
filetype on 
syntax on
set nu
set noswapfile
set encoding=utf-8
set noautochdir
colorscheme desert

"[Fzf]    <-------------------------------------------
set rtp+=/usr/local/opt/fzf
"[Fzf]    ------------------------------------------->

"[Vundle] <-------------------------------------------
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'

"Filesystem
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim' 

"Colors!!!
Plugin 'altercation/vim-colors-solarized'
Plugin 'jnurmine/Zenburn'

"Python Bundles
Plugin 'nvie/vim-flake8'
Plugin 'klen/rope-vim'

"Code Folding Bundles
Plugin 'tmhedberg/SimpylFold'

"Powerline
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

"Fuzzy Search
Plugin 'wincent/command-t'

"Snippets
Plugin 'SirVer/ultisnips'

call vundle#end()
"[Vundle]    ------------------------------------------->

"[NERDTree] <-------------------------------------------
""Auto-start NERDTree on vim startup
autocmd vimenter * NERDTree 
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in:") | NERDTree | endif

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden = 1
autocmd VimEnter * wincmd p | "Auto focus on file window
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
"[NERDTree]    ------------------------------------------->


"[Key Bindings] <-------------------------------------------
nmap <leader>nf :NERDTreeFind<CR>
nmap <leader>nm :NERDTreeToggle<CR>
nmap <leader>fr :w<cr>:!./%<CR>
nmap <leader>fs :%s/\s\+$//e<CR> :w<CR>
nmap <leader>fw :%s/\s\+$//e<CR>

imap jj <Esc>

"[Key Bindings] <-------------------------------------------


"[UltiSnips] <-------------------------------------------
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
"runtime path is the search path for the snippet folder 
set runtimepath+=/Users/ottocheung/.vim/vim-snippets
let g:UltiSnipsSnippetsDir='/Users/ottocheung/.vim/vim-snippets/custom'
let g:UltiSnipsSnippetDirectories=['UltiSnips','custom'] 
let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsListSnippets="<C-j>"
let g:UltiSnipsEnableSnipMate=0
"[UltiSnips] ------------------------------------------->

"[Powerline] <-------------------------------------------
set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8
"[Powerline] ------------------------------------------->

filetype plugin indent on    " enables filetype detection
let g:SimpylFold_docstring_preview = 1

"python with virtualenv support
py << EOF
import os.path
import sys
import vim
if 'VIRTUA_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  sys.path.insert(0, project_base_dir)
  activate_this = os.path.join(project_base_dir,'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

"it would be nice to set tag files by the active virtualenv here
":set tags=~/mytags "tags for ctags and taglist
"omnicomplete
autocmd FileType python set omnifunc=pythoncomplete#Complete

"------------Start Python PEP 8 stuff----------------
" Number of spaces that a pre-existing tab is equal to.
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

"spaces for indents
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py set softtabstop=4

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw, set textwidth=100

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix
" For full syntax highlighting:
let python_highlight_all=1

" Keep indentation level from previous line:
autocmd FileType python set autoindent

" make backspaces more powerfull
set backspace=indent,eol,start


"Folding based on indentation:
autocmd FileType python set foldmethod=syntax
"use space to open folds
nnoremap <space> za 
"----------Stop python PEP 8 stuff--------------

"js stuff"
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2


