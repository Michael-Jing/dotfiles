set nocompatible
set hidden
set showtabline=0

" Specify a directory for plugins
set rtp+=~/.local/share/nvim/plugged
call plug#begin('~/.local/share/nvim/plugged')

" Add all your plugins here
"-------------------=== Code/Project navigation ===-------------
  Plug 'chriskempson/base16-vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  " Better Visual Guide
  Plug 'Yggdroot/indentLine'
  " syntax check
  Plug 'w0rp/ale'
  " Autocomplete
  Plug 'ncm2/ncm2'
  Plug 'roxma/nvim-yarp'
  Plug 'ncm2/ncm2-bufword'
  Plug 'ncm2/ncm2-path'
  Plug 'ncm2/ncm2-jedi'
  " Formater
  Plug 'Chiel92/vim-autoformat'
  Plug 'junegunn/seoul256.vim'
  Plug 'vim-scripts/AutoClose'
  Plug 'easymotion/vim-easymotion'
  Plug 'tpope/vim-commentary'
  Plug 'jpalardy/vim-slim'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'rking/ag.vim'
"  Plug 'jiangmiao/auto-pairs'
"Plug 'scrooloose/nerdtree'                " Project and file navigation
"Plug 'Xuyuanp/nerdtree-git-plugin'        " NerdTree git functionality
"Plug 'neomake/neomake'                    " Asynchronous Linting and Make Framework
"Plug 'Shougo/deoplete.nvim'               " Asynchronous Completion
"Plug 'vim-ctrlspace/vim-ctrlspace'        " Tabs/Buffers/Fuzzy/Workspaces/Bookmarks
"Plug 'mileszs/ack.vim'                    " Ag/Grep
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"Plug 'junegunn/fzf.vim'
"" Uncomment if you want to use vim-airline over lightline
"" Plug 'vim-airline/vim-airline'            " Lean & mean status/tabline for vim
"" Plug 'vim-airline/vim-airline-themes'     " Themes for airline
"Plug 'itchyny/lightline.vim'
"Plug 'yuttie/comfortable-motion.vim'      " Smooth scrolling
"Plug 'thaerkh/vim-indentguides'           " Visual representation of indents
"Plug 'majutsushi/tagbar'                  " Class/module browser
"Plug 'bling/vim-bufferline'               " Buffer-line vim - show list of buffers in command bar
"

"-------------------=== Snippets support ===------------------------
" Plug 'honza/vim-snippets'                 " snippets repo
" Plug 'Raimondi/delimitMate'               " Auto-close brackets

"-------------------=== Languages support ===-----------------------
" Plug 'scrooloose/nerdcommenter'           " Easy code documentation
" Plug 'mitsuhiko/vim-sparkup'              " Sparkup(XML/jinja/htlm-django/etc.) support

"-------------------=== Python ===----------------------------------
Plug 'klen/python-mode'                   " Python mode (docs, refactor, lints...)
" Plug 'jmcantrell/vim-virtualenv'

"-------------------=== Go ===---------------------------------------
" Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}

" Initialize plugin system
call plug#end()

filetype on
filetype plugin on
filetype plugin indent on

set nu
set relativenumber
set cursorline
syntax on
syntax enable

" colorscheme
let base16colorspace=256
colorscheme base16-gruvbox-dark-hard
set background=dark

" True Color Support if itso available in terminal
if has("termguicolors")
	set termguicolors
endif
if has("gui_running")
  set guicursor=n-v-c-sm:block,i-ci-ve:block,r-cr-o:blocks
endif

" Turn off backup
set nobackup
set noswapfile
set nowritebackup

" Search configuration
set ignorecase
set smartcase

" Tab and Indent configuration
set expandtab
set tabstop=4
set shiftwidth=4

" vim-autoformat
noremap <F3> :Autoformat<CR>
" NCM2

augroup NCM2
	autocmd!
	" enable ncm2 for all buffers
	autocmd BufEnter * call ncm2#enable_for_buffer()
	" :help Ncm2PopupOpen nfor more information
	set completeopt=noinsert,menuone,noselect
        inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
augroup END


" ale
let g:ale_fixers = {
\ '*': ['remove_trailing_lines', 'trim_whitespace'],
\}

let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
" Airline will display ale errer message
let g:ariline#extensions#ale#enabled = 1
" navigate between errors quickly
nmap <silent> <C-t> <Plug>(ale_previous_wrap)
nmap <silent> <C-H> <Plug>(ale_next_wrap)
let g:ale_set_quickfix = 1
let g:ale_open_list = 1

" Airline
let g:airline_left_sep  = ''
let g:airline_right_sep = ''
let g:airline#extensions#ale#enabled = 1
let airline#extensions#ale#error_symbol = 'E:'
let airline#extensions#ale#warning_symbol = 'W:'

" slim for Python
let g:slim_python_ipython = 1
let g:slim_target = "neovim"

" ctrlp configuration
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
" nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
" "command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>
