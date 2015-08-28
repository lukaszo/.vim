

" enable vundle
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

"============================================

" let Vundle manage Vundle
Plugin 'gmarik/vundle'

"Plugin 'The-NERD-tree'
Plugin 'Tagbar'
Plugin 'TaskList.vim'
"Plugin 'compview'
"Plugin 'EasyMotion'
Plugin 'EasyGrep'
"Plugin 'ZoomWin'
"Plugin 'unimpaired.vim'
Plugin 'vcscommand.vim'
Plugin 'Gundo'

" doesn't exist anymore
" Plugin 'https://github.com/sontek/minibufexpl.vim'

" Lean & mean status/tabline for vim that's light as air.
Plugin 'bling/vim-airline'

" Snippets
Plugin 'git://github.com/SirVer/ultisnips.git'

" python
Plugin 'pyflakes.vim'
Plugin 'pylint.vim'
Plugin 'python.vim--Vasiliev'
Plugin 'python_ifold'
Plugin 'SuperTab'
Plugin 'virtualenv.vim'
Plugin 'py_jump.vim'
Plugin 'python.vim'

" autocompletion
Plugin 'git://github.com/davidhalter/jedi-vim.git'

" git
Plugin 'fugitive.vim'
Plugin 'extradite.vim'

" lua support
Plugin 'git://github.com/xolox/vim-misc.git'
Plugin 'git://github.com/xolox/vim-lua-ftplugin.git'

" Full path fuzzy file, buffer, mru, tag, ... finder for Vim. 
Plugin 'https://github.com/kien/ctrlp.vim.git'

" colors
"Plugin "vim-colors-solarized"

call vundle#end()

"============================================

" Automatically detect file types.
 filetype plugin indent on

" Do not close buffers
 set hidden

" Syntax highlighting
 syntax on

" allow backspacing over everything in insert mode
 set backspace=indent,eol,start

" display incomplete commands
 set showcmd		

" Do case in sensitive matching with
 set ignorecase  

" be sensitive when there's a capital letterset 
 set smartcase       

" do incremental searching
 set incsearch		

" Color Scheme
 if has("gui_running")
    colorscheme wombat
 else
    set term=xterm-256color
    colorscheme wombat256
 endif

" do not keep a backup file, use versions instead
 if has("vms")
   set nobackup		
" keep a backup file
 else
   set backup		
   set backupdir=/tmp
 endif

" Switch to current file dir
set autochdir

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
 autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" always set autoindenting on
set autoindent		

" For all text files set 'textwidth' to 78 characters.
 autocmd FileType text setlocal textwidth=78

" folding 
 set foldenable
 set foldmethod=syntax
 set foldcolumn=4	
 set foldnestmax=1

" In many terminal emulators the mouse works just fine, thus enable it.
 set mouse=a

" Switch on highlighting the last used search pattern.
 if &t_Co > 2 || has("gui_running")
     set hlsearch
 endif

" wraps lines (no long line)
 set wrap

" shows line number
 set number

" shows visualbell instead beeping
set visualbell

" shows matching bracket
 set showmatch

" coding
 set fenc=utf-8
 set enc=utf-8
 set tenc=utf-8

" show the cursor position all the time
 set ruler		

" keep 100 lines of command line history
 set history=100		

" supertab , set first match
 let g:SuperTabDefaultCompletionType = "context"
 set completeopt=menu

" toggle between paste and normal: for 'safer' pasting from keyboard
 set pastetoggle=<F10> 

" keep swap files in same directory
 set directory+=,~/.vim/tmp,$TMP

" Gundo
 nnoremap <F5> :GundoToggle<CR>

">>> PYTHON <<<

" pylint
 autocmd FileType python compiler pylint
 " Don't run on write
 let g:pylint_onwrite = 0

" pyflakes
 let g:pyflakes_use_quickfix = 0

" python_ifold
 let g:ifold_mode=2

" hihgliht all (syntax/python.vim)
 let python_highlight_all = 1

" tabulation
 au BufEnter *.py set ai sw=4 ts=4 sta et fo=croql 

" omnicompletion
" autocmd FileType python set omnifunc=pythoncomplete#Complete
" set completeopt=preview,longest,menu
" set completefunc=pythoncomplete#Complete

" >>> END PYTHON <<<

" jedi options
let g:jedi#use_tabs_not_buffers = 0

" enable spell checking for text files
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.rst setlocal spell

" vim-airline options
 let g:airline#extensions#tabline#enabled = 1
 set laststatus=2
 let g:airline_powerline_fonts = 1
 nnoremap <A-right> :bnext<CR>
 nnoremap <A-left> :bprev<CR>
