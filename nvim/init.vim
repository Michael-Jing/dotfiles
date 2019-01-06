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
"nerd tree"
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'


  " Autocomplete
  Plug 'ncm2/ncm2'
  Plug 'roxma/nvim-yarp'
  Plug 'ncm2/ncm2-bufword'
  Plug 'ncm2/ncm2-path'
  Plug 'ncm2/ncm2-jedi'
  Plug 'ncm2/ncm2-tmux'
  Plug 'ncm2/ncm2-racer'
  Plug 'vim-scripts/AutoClose'
"   Plug 'Townk/vim-autoclose'

  " Formater
  Plug 'Chiel92/vim-autoformat'
  Plug 'junegunn/seoul256.vim'
"  Plug 'cohama/lexima.vim'
  Plug 'easymotion/vim-easymotion'
  Plug 'tpope/vim-commentary'
  Plug 'jpalardy/vim-slim'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'rking/ag.vim'
  "Rust Language
  Plug 'rust-lang/rust.vim'
  Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

  Plug 'lepture/vim-jinja'
  " (Optional) Multi-entry selection UI.

  Plug 'junegunn/fzf'
  Plug 'Michael-Jing/vim-tmux-navigator'

  ""Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  " debbugger "

  " "Plug 'idanarye/vim-vebugger'
  " "Plug 'Shougo/vimproc.vim', {'do' : 'make'}
  " "Plug 'zchee/deoplete-jedi'

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
" Plug 'klen/python-mode'                   " Python mode (docs, refactor, lints...)
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

" rust lang"
let g:autofmt_autosave = 1
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'python': ['pyls'],
    \ }
noremap <silent> H :call LanguageClient_textDocument_hover()<CR>
noremap <silent> Z :call LanguageClient_textDocument_definition()<CR>
noremap <silent> R :call LanguageClient_textDocument_rename()<CR>
noremap <silent> S :call LanugageClient_textDocument_documentSymbol()<CR>


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

" map enter to go the next line first"$
imap <expr> <CR> ((col(".") != col("$") - 1) ? "\<CR>" : "\<Esc>$a")
" "autocmd FileType python map <buffer> <CR> <Esc>$o

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

 " Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Nerdtree git plugin config"
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" Nerdtree "
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif


map <C-b> :NERDTreeToggle<CR>

" close vim if the only window left open is a NERDTree"
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

map <F5> :call CompileRunGcc()<CR>
    func! CompileRunGcc()
        exec "w"
        if &filetype == 'c'
            exec "!g++ % -o %<"
            exec "!time ./%<"
        elseif &filetype == 'cpp'
            exec "!g++ % -o %<"
            exec "!time ./%<"
        elseif &filetype == 'java'
            exec "!javac %"
            exec "!time java %<"
        elseif &filetype == 'sh'
            :!time bash %
        elseif &filetype == 'python'
            exec "!time python %"
        elseif &filetype == 'html'
            exec "!firefox % &"
        elseif &filetype == 'go'
    "        exec "!go build %<"
            exec "!time go run %"
        elseif &filetype == 'mkd'
            exec "!~/.vim/markdown.pl % > %.html &"
            exec "!firefox %.html &"
        endif
    endfunc

aug QFClose
  au!
  au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
aug END

" enable basic auto close rules for lexima
let g:lexima_enable_basic_rules = 1
let g:lexima_enable_newline_rules = 1
let g:lexima_enable_endwise_rules = 1

" vv to generate new vertical split
nnoremap <silent> vv <C-w>v
" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>

" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>
" Inspect runner pane
map <Leader>vi :VimuxInspectRunner<CR>
"nnoremap <C-T> <C-W><C-J>
"nnoremap <C-N> <C-W><C-K>
"nnoremap <C-S> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>

" Tmux vim navigation
"let g:tmux_navigator_no_mappings = 1
"nnoremap <silent> {c-h} :TmuxNavigateLeft<cr>
"nnoremap <silent> {c-t} :TmuxNavigateDown<cr>
"nnoremap <silent> {c-n} :TmuxNavigateUp<cr>
"nnoremap <silent> {c-s} :TmuxNavigateRight<cr>
"nnoremap <silent> {c-\} :TmuxNavigatePrevious<cr>
let g:tmux_navigator_save_on_switch = 2
let g:tmux_navigator_disable_when_zoomed = 1