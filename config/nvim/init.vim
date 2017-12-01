syntax enable
filetype plugin indent on
set autoindent
set expandtab
set smarttab
set shiftwidth=4
set softtabstop=4
set wildmenu
set wildmode=list:longest,full
set backspace=2
set number
set relativenumber
set ignorecase
set smartcase
set breakindent
set breakindentopt=shift:4
set incsearch
set hlsearch
set gdefault
nnoremap ; :
if !&scrolloff
    set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
    set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif
set nostartofline
let mapleader="\<SPACE>"
let g:ale_set_highlights = 0
let g:ale_completion_enabled=1
let g:ale_lint_on_insert_leave=1
let g:JavaComplete_ClosingBrace = 0
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
au BufNewFile,BufRead *.ejs set filetype=html
set guicursor=n-v-c:block-Cursor/lCursor-blinkon1,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
set wrap
set linebreak
let g:ale_linters = { 
            \    'rust': ['rls','cargo'],
            \    'haskell': ['stack-ghc', 'hlint'],
            \}
"'haskell': ['hlint'],
let g:deoplete#enable_at_startup = 1
call plug#begin('~/.nvim/plugged')
Plug 'w0rp/ale'
Plug 'pbrisbin/vim-syntax-shakespeare'
Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }
Plug 'HerringtonDarkholme/yats.vim'
Plug 'artur-shaik/vim-javacomplete2'
"Plug 'mhartington/nvim-typescript'
Plug 'junegunn/vim-easy-align'
Plug 'itchyny/lightline.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'rust-lang/rust.vim'
Plug 'mattn/emmet-vim'
Plug 'cespare/vim-toml'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-surround'
Plug 'lepture/vim-jinja'
Plug 'neovimhaskell/haskell-vim'
Plug 'racer-rust/vim-racer'
"Plug 'autozimu/LanguageClient-neovim'
call plug#end()

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

autocmd FileType java setlocal omnifunc=javacomplete#Complete
