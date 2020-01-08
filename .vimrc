" enable vundle
set nocompatible               " be iMproved

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

"Plug 'The-NERD-tree'
Plug 'majutsushi/tagbar'
Plug 'https://github.com/sjl/gundo.vim.git'
Plug 'SirVer/ultisnips'

" Lean & mean status/tabline for vim that's light as air.
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" git
Plug 'https://github.com/tpope/vim-fugitive.git'
"  Plug 'extradite.vim'

" python
Plug 'Vimjas/vim-python-pep8-indent'
" had to install it manually https://github.com/psf/black/issues/672#issuecomment-492683850
Plug 'psf/black'

" lua support
"  Plug 'git://github.com/xolox/vim-misc.git'
"  Plug 'git://github.com/xolox/vim-lua-ftplugin.git'

" Full path fuzzy file, buffer, mru, tag, ... finder for Vim. 
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'

" Vim plugin for the_silver_searcher, 'ag', a replacement for the Perl module / CLI script 'ack'
Plug 'https://github.com/rking/ag.vim.git'

" golang
Plug 'fatih/vim-go'

" dart
Plug 'dart-lang/dart-vim-plugin'

" flutter
Plug 'thosakwe/vim-flutter'

" taskworrior
"   Plug 'https://github.com/blindFS/vim-taskwarrior.git'

" Asynchronous Lint Engine
Plug 'dense-analysis/ale'

" AutoCompletion
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'zchee/deoplete-go'
Plug 'https://github.com/Shougo/deoplete-clangx'

call plug#end()

"============================================

" Do not close buffers
 set hidden

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

" toggle between paste and normal: for 'safer' pasting from keyboard
 set pastetoggle=<F10> 

" keep swap files in same directory
 set directory+=,~/.vim/tmp,$TMP

" Gundo
nnoremap <F5> :GundoToggle<CR>
if has('python3')
  let g:gundo_prefer_python3 = 1 " anything else breaks on Ubuntu 16.04+
endif

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

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

" autoformat code on write
 autocmd BufWritePre *.py execute ':Black'

" >>> END PYTHON <<<

" enable spell checking for text files
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.rst setlocal spell
set spelllang=pl,en

" vim-airline options
 let g:airline#extensions#tabline#enabled = 1
 set laststatus=2
 let g:airline_powerline_fonts = 1
 nnoremap <A-right> :bnext<CR>
 nnoremap <A-left> :bprev<CR>

" Ag
let g:ag_working_path_mode="r"
let g:ag_prg="ag --silent --vimgrep"

" Tagbar
nmap <F8> :TagbarToggle<CR>

" ctrlp
let g:ctrlp_extensions = ['tag']
if executable('rg')
  " Use rg over grep
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'rg %s --no-ignore --files -g "" '
  " rg is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
elseif executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Go lang
" Enable goimports to automatically insert import paths instead of gofmt
let g:go_fmt_command = "goimports"
let g:go_fmt_experimental = 1
" let g:go_auto_type_info = 1
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

" dart
let g:dart_format_on_save=1
let g:dart_style_guide=1

" higlighting
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

" ALE
let g:ale_fixers = {
\    'python': ['autopep8'],
\}

let g:ale_linters = {
\ 'go': ['gopls'],
\}

" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1

" deoplete
let g:deoplete#enable_at_startup = 1
autocmd CompleteDone * silent! pclose!
let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources._ = ['buffer']
