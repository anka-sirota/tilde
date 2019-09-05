filetype off
runtime ~/.vim/bundle/vim-pathogen/autoload/pathogen.vim
source ~/.vim/bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()
if !&cp | set cp | endif
let s:cpo_save=&cpo
set cpo&vim
set encoding=utf8
set history=1000
set nocompatible      " Don't force vi compatibility
set keymodel=""       " mswin includes start/stopsel.
set ai                " Turn on smartindenting
set aw                " Save file when compiling, etc.
set bs=2              " Allow backspacing over everything in insert mode
"set guioptions=tae   
set viminfo='20,\"50  " Read/write a .viminfo file, don't store more
                " than 50 lines of registers
set whichwrap=b,s,<,>,[,] " End of line cursor support
set nobackup          " Do not create backup files
set ruler
set shiftwidth=4 tabstop=4 softtabstop=4 expandtab
set incsearch
set hlsearch
set ignorecase
set smartcase
set wildmenu
set wildmode=list:longest
set scrolloff=3
set number
set foldmethod=indent
set foldlevel=99
syntax on
filetype on
filetype plugin on
filetype indent on
map <silent> <F4> :silent :NERDTreeToggle<CR>
imap <silent> <F4> :silent :NERDTreeToggle<CR>
let NERDTreeIgnore=['__pycache__']
 
set dir=~/.vim/swap

nmap <F2> :nohl<CR>
imap <F2> :nohl<CR>

map! <S-Insert> *
vmap  "*d
vmap <C-Del> "*d
vmap <S-Del> "*d
vmap <C-Insert> "*y
vmap <S-Insert> "-d"*P
nmap <S-Insert> "*P
nmap <A-v> "+p
set helplang=en
syntax enable
autocmd FileType python map <buffer> <F7> :Black<CR>
autocmd FileType python map <buffer> <F3> :call Flake8()<CR>
let g:flake8_cmd="/home/anka/envs/supply/bin/flake8"
map <Leader>kk :sign unplace *<CR>
map <Leader>td <Plug>TaskList
map <Leader>g :GundoToggle<CR>
" au FileType python set omnifunc=pythoncomplete#Complete
" let g:SuperTabDefaultCompletionType = "context"
map <Leader>j :RopeGotoDefinition<CR>
map <Leader>r :RopeRename<CR>
map <F5> :BufOnly<CR>
nmap <Leader>a <Esc>:Ack!
noremap <F1> :Ack <cword><CR>
let g:miniBufExplMapCTabSwitchBufs = 1
map <F6> :MBEbd<CR>
let g:miniBufExplCycleArround = 1
noremap <C-tab> :MBEbn<CR>
noremap <S-tab> :MBEbp<CR>
noremap <C-S-tab> :MBEbp<CR>
let g:miniBufExplCheckDupeBufs = 0
let NERDTreeIgnore = ['\.pyc$']
"map <Leader>k :Critic<CR>
" autocmd! BufReadPost,BufWritePost,FileReadPost,FileWritePost *.pl call ShowCriticisms()
" autocmd! BufReadPost,BufWritePost,FileReadPost,FileWritePost *.pm call ShowCriticisms()
let g:crit_severity_level=1
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
colorscheme mine 
set colorcolumn=120
let g:vcoolor_lowercase = 1
let g:vcoolor_disable_mappings = 1
vmap <Leader>ka :VCoolIns ra<CR>
map <Leader>ka :VCoolIns ra<CR>
nmap <Leader>ka :VCoolIns ra<CR>
vmap <Leader>k :VCoolor<CR>
map <Leader>k :VCoolor<CR>
nmap <Leader>k :VCoolor<CR>

"set follow option  in your vimrc,Press 't' in NERDTree directory node will open the directory in a new tab,
"and will also sets VIM working directory to that directory node
let g:NERDTreeChDirMode=2

"some action when enter a tab
function! TabEnterTag(nr)
   "echo "tab ". a:nr . " enter"
   call TabReloadCGtag()
endfunction

"some action when leave a tab
function! TabLeaveTag(nr)
   "echo "tab ". a:nr . " leaves"
   "nothing
endfunction

"don't care about pattern field for now
let g:TabTagTrigger = {'name':'TabTagTriger','pattern':"", 'enter_callback':"TabEnterTag", 'leave_callback':"TabLeaveTag" }

"call tab#TabShowTrigger()
"call tab#TabAddTrigger(g:TabTagTrigger)
set guifont=Monospace\ 11
set tags=tags
autocmd FileType tf,scss,pug,php,inc,module,yaml,javascript,perl,t,typescript setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
silent! iunmap <Tab>
set spell
