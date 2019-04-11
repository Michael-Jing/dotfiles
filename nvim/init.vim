set nocompatible
set hidden
set showtabline=0
" Specify a directory for plugins
set rtp+=~/.local/share/nvim/plugged
call plug#begin('~/.local/share/nvim/plugged')
" Add all your plugins here
  Plug 'chriskempson/base16-vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  " Better Visual Guide
  Plug 'Yggdroot/indentLine'
  " syntax check
  Plug 'w0rp/ale'
  Plug 'ncm2/ncm2'
  Plug 'roxma/nvim-yarp'
  Plug 'ncm2/ncm2-bufword'
  Plug 'ncm2/ncm2-path'
  Plug 'ncm2/ncm2-jedi'
  Plug 'ncm2/ncm2-tmux'
  Plug 'vim-scripts/AutoClose'
  " Plug 'Raimondi/delimitMate'
  " Formater
  Plug 'Chiel92/vim-autoformat'
  Plug 'junegunn/seoul256.vim'
  Plug 'easymotion/vim-easymotion'
  Plug 'tpope/vim-commentary'
  Plug 'rking/ag.vim'
  Plug 'lepture/vim-jinja'
  Plug 'Michael-Jing/vim-tmux-navigator'
  Plug 'google/yapf'
  ""Plug 'timothycrosley/isort'
  Plug 'skywind3000/asyncrun.vim'
  Plug 'kien/rainbow_parentheses.vim'
  Plug 'tpope/vim-surround'
  Plug 'vim-scripts/ReplaceWithRegister'
  Plug 'christoomey/vim-system-copy'
  Plug 'Shougo/denite.nvim'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  Plug 'junegunn/vim-easy-align'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'benmills/vimux'
  Plug 'julienr/vimux-pyutils'
  Plug 'davidhalter/jedi-vim'
  Plug 'metalelf0/supertab'
  Plug 'mkitt/tabline.vim'

  " "Plug 'idanarye/vim-vebugger'
  " "Plug 'Shougo/vimproc.vim', {'do' : 'make'}
  " "Plug 'zchee/deoplete-jedi'
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
" noremap <silent> R :call LanguageClient_textDocument_rename()<CR>
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
imap <expr> <c-n> ((col(".") == col("$")) ? "\<CR>" : "\<Esc>$a")
" "autocmd FileType python map <buffer> <CR> <Esc>$o

" ale
let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\ '*': ['remove_trailing_lines', 'trim_whitespace'],
\ 'python' : [
\       'remove_trailing_lines',
\       'isort',
\       'yapf'
\    ]
\}

" Airline will display ale errer message
let g:ariline#extensions#ale#enabled = 1
" navigate between errors quickly
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
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
"let g:ctrlp_map = '<c-l>'
"let g:ctrlp_cmd = 'CtrlP'
"let g:ctrlp_working_path_mode = 'ra'
"set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
"let g:ctrlp_custom_ignore = {
"  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
"  \ 'file': '\v\.(exe|so|dll)$',
"  \ 'link': 'some_bad_symbolic_links',
"  \ }

nmap <C-l> :Files<CR>
nmap <C-e> :Buffers<CR>
let g:fzf_action = { 'ctrl-e': 'edit'}

" The Silver Searcher
""if executable('ag')
  " Use ag over grep
""  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
""  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
""  let g:ctrlp_use_caching = 0
" "endif

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
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif


map <F3> :NERDTreeToggle<CR>

" close vim if the only window left open is a NERDTree"
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

map <F5> :call CompileRunGcc()<CR>
    func! CompileRunGcc()
        exec "w"
        if &filetype == 'c'
            exec "AsyncRun! g++ % -o %<; time ./%<"
        elseif &filetype == 'cpp'
            exec "AsyncRun! g++ % -o %<; time ./%<"
        elseif &filetype == 'java'
            exec "AsyncRun! javac %; time java %<"
        elseif &filetype == 'sh'
            :AsyncRun time bash %
        elseif &filetype == 'python'
            exec "AsyncRun! time python %"
        elseif &filetype == 'html'
            exec "AsyncRun! firefox % &"
        elseif &filetype == 'go'
    "       exec "AsyncRun! go build %<; time go run %"
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

let g:tmux_navigator_save_on_switch = 2
let g:tmux_navigator_disable_when_zoomed = 1
let mapleader = ","
let maplocalleader = "\\"

" map sort function to a key
vnoremap <Leader>s :sort<CR>

" easier moving of code blocks
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation

set smartcase
set ignorecase
set smartindent
" Quick quit command
noremap <Leader>e :wquit<CR> " Quit current window"
noremap <Leader>E :wqa!<CR> " Quit all windows"

set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab



" Python mode configuration"
let g:pymode_python = 'python3'
hi pythonSelf ctermfg=174 guifg=#6094DB cterm=bold gui=bold
autocmd FileType python nnoremap <LocalLeader>g :call RopeGotoDefinition()<CR>

" format code
autocmd FileType python nnoremap <LocalLeader>= :0,$!yapf<CR>
autocmd FileType python nnoremap <LocalLeader>i :!isort %<CR><CR>

"pytho repl"
autocmd FileType python nnoremap <LocalLeader>r :REPLToggle<CR>


"Auto format"
nnoremap <F6> :Autoformat<CR>
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

let g:rbpt_colorpairs = [
                        \ ['brown',       'RoyalBlue3'],
                        \ ['Darkblue',    'SeaGreen3'],
                        \ ['darkgray',    'DarkOrchid3'],
                        \ ['darkgreen',   'firebrick3'],
                        \ ['darkcyan',    'RoyalBlue3'],
                        \ ['darkred',     'SeaGreen3'],
                        \ ['darkmagenta', 'DarkOrchid3'],
                        \ ['brown',       'firebrick3'],
                        \ ['gray',        'RoyalBlue3'],
                        \ ['darkmagenta', 'DarkOrchid3'],
                        \ ['Darkblue',    'firebrick3'],
                        \ ['darkgreen',   'RoyalBlue3'],
                        \ ['darkcyan',    'SeaGreen3'],
                        \ ['darkred',     'DarkOrchid3'],
                        \ ['red',         'firebrick3'],
                        \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Easy align interactive"
vnoremap <silent> <Enter> :EasyAlign<CR>

" split panes to right and bottom
set splitbelow
set splitright

"transparency background"
" "hi Normal guibg=NONE ctermbg=NONE

" fold by default"
" set foldmethod=indent

" jedi configuration"
" let g:jedi#use_splits_not_buffers = "right"
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#completions_enabled = 0

" tabline config"
hi TabLine      ctermfg=Black  ctermbg=Green     cterm=NONE
hi TabLineFill  ctermfg=Black  ctermbg=Green     cterm=NONE
hi TabLineSel   ctermfg=White  ctermbg=DarkBlue  cterm=NONE

" auto  indent and open new line
" let delimitMate_expand_cr = 1
let g:python3_host_prog = "/home/michael/anaconda3/bin/python"
let g:python2_host_prog = "/usr/bin/python2"
