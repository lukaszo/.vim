if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')

Plug 'preservim/nerdtree' "|
"  \ Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'

"Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
"Plug 'honza/vim-snippets'

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
Plug 'nvim-lua/plenary.nvim'
Plug 'akinsho/flutter-tools.nvim'


" taskworrior
"   Plug 'https://github.com/blindFS/vim-taskwarrior.git'

" Asynchronous Lint Engine
Plug 'dense-analysis/ale'

" JSON
Plug 'https://github.com/elzr/vim-json'

"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'

Plug 'https://github.com/rhysd/vim-grammarous'

Plug 'wakatime/vim-wakatime'

" coq
" main one
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
" 9000+ Snippets
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

" lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
" Need to **configure separately**

Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}

Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

Plug 'sheerun/vim-polyglot'

" colorscheme

Plug 'https://github.com/dracula/vim'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'mhartington/oceanic-next'
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug 'gryf/wombat256grf'

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

Plug 'editorconfig/editorconfig-vim'
"Plug 'ryanoasis/vim-devicons'

" For chatgpt plugins
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'jackMort/ChatGPT.nvim'

" For copilot
Plug 'github/copilot.vim'

call plug#end()

function OpenMarkdownPreview (url)
  execute "silent ! chromium --new-window " . a:url
endfunction
let g:mkdp_browserfunc = 'OpenMarkdownPreview'

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

set termguicolors
colorscheme wombat256grf

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
 set directory=~/.tmp,$TMP

nnoremap <F5> :UndotreeToggle<CR>

">>> PYTHON <<<

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
" + language tool
let g:grammarous#default_comments_only_filetypes = {
            \ '*' : 1, 'help' : 0, 'markdown' : 0,
	    \ }

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
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/*,*/\.git/*
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
let g:go_doc_keywordprg_enabled = 0
" Automatically get signature/type info for object under curso
let g:go_auto_type_info = 1
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_doc_popup_window = 1
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
" higlighting
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_metalinter_command = 'golangci-lint'

" dart
let g:dart_format_on_save=1
let g:dart_style_guide=1

" ALE
let g:ale_fixers = {
\    'python': ['autopep8'],
\}

let g:ale_linters = {
\ 'go': [],
\ 'dart': [],
\ 'python': ['jedils'],
\ 'ruby': [],
\}

" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1
let g:ale_hover_to_preview = 1

" json
com! FormatJSON %!jq .

lua <<EOF

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

require("flutter-tools").setup{
  flutter_path = "/home/slm/snap/flutter/common/flutter/bin/flutter",
  closing_tags = {
    prefix = ">>> ", -- character to use for close tag e.g. > Widget
    enabled = true, -- set to false to disable
  },
}

require'lspconfig'.gopls.setup {
  cmd = {"gopls", "serve"},
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
        nilness = true,
        shadow = true,
        unusedwrite = true,
        useany = true,
        unusedvariable = true,
      },
      staticcheck = true,
    },
  },
}
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.go',
  callback = function()
    vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })
  end
})

require'lspconfig'.solargraph.setup{
 -- cmd = {'bundle', 'exec', 'solargraph', 'stdio'},
}

require"chatgpt".setup{
 --optional configuration
  keymaps = {
    submit = "<C-l>",
    close = { "<C-c>" },
    yank_last = "<C-y>",
    yank_last_code = "<C-k>",
    scroll_up = "<C-u>",
    scroll_down = "<C-d>",
    toggle_settings = "<C-o>",
    new_session = "<C-n>",
    cycle_windows = "<Tab>",
    select_session = "<Space>",
    rename_session = "r",
    delete_session = "d",
  }
}

require'lspconfig'.csharp_ls.setup{}

-- not needed, done by flutter-tools
-- require'lspconfig'.dartls.setup{}
EOF

" LSP
 " Open code actions using the default lsp UI, if you want to change this please see the plugins above
nnoremap <leader>ca <Cmd>lua vim.lsp.buf.code_action()<CR>
 " Open code actions for the selected visual range
xnoremap <leader>ca <Cmd>lua vim.lsp.buf.range_code_action()<CR>

