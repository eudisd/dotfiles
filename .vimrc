" Us Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" TODO: this may not be in the correct place. It is intended to allow overriding <Leader>.
" source ~/.vimrc.before if it exists.
if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif

" =============== Pathogen Initialization ===============
" This loads all the plugins in ~/.vim/bundle
" Use tpope's pathogen plugin to manage all other plugins

runtime bundle/tpope-vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

" ================ General Config ====================

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set spell

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax on

" set wrap

" ================ Search Settings  =================

set incsearch        "Find the next match as we type the search
set hlsearch         "Hilight searches by default
set viminfo='100,f1  "Save up to 100 marks, enable capital marks

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.

silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ==============Set Leader Key ======================
let mapleader=","

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ================ Status Line Info =================

set ruler
set rulerformat=%-14.(%l,%c%V%)\ %P
set statusline=%F%m%r%h%w\ 
set statusline+=%{fugitive#statusline()}\    
set statusline+=[%{strlen(&fenc)?&fenc:&enc}]
set statusline+=\ [line\ %l\/%L] 
"set statusline+=%{rvm#statusline()} 

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" Custom Compiler Option For PyLinting
" autocmd FileType python compiler pylint

" :autocmd InsertEnter,InsertLeave * set cul!
" ================= Custom Functions ===============


" ================= Custom Mappings ================= 
nmap <c-t> :vs<bar>:b#<CR>  " Open the last closed window
noremap <leader>o <Esc>:CommandT<CR> 
noremap <leader>O <Esc>:CommandTFlush<CR> 
noremap <leader>m <Esc>:CommandTBuffer<CR>

let g:tagbar_usearrows = 1
nnoremap <leader>l :TagbarToggle<CR>
nnoremap <leader>n :NERDTree<CR>

map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>

" Ignore .pyc files in NerdTree
let NERDTreeIgnore = ['\.pyc$']

" PyMode Configuration Begin
let g:pymode = 1
let g:pymode_folding = 1
let g:pymode_breakpoint = 1
let g:pymode_lint = 1
let g:pymode_lint_on_fly = 0
let g:pymode_lint_message = 1
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']
let g:pymode_rope_completion = 1
let g:pymode_rope_complete_on_dot = 1
let g:pymode_rope_autoimport = 1
let g:pymode_rope_autoimport_modules = ["os.*", "traceback", "django.*", "xml.etree"]
" This opens the definition on a split window
let g:pymode_rope_goto_def_newwin = "new"
let g:pymode_virtualenv_path = '/Users/eudis/vm/sop'
let g:pymode_breakpoint_bind = '<leader>b'
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
" let g:ropevim_open_files_in_tabs = 1



" This bit of code imports all the modules into the Rope namespace,
" so that it can detect those libs.
let g:pymode_paths = ['/Users/eudis/repos/git/work/sop/unified_platform','/Users/eudis/repos/git/work/sop/unified_platform/apps','/Users/eudis/repos/git/work/sop/unified_platform/libs/unified','/Users/eudis/repos/git/work/sop/unified_platform/libs/third-party','/Users/eudis/vm/sop/lib/python2.7/site-packages']

"let g:ropevim_autoimport_modules = ["os.*", "traceback", "django.*", "xml.etree"]

" PyMode Configuration End

"let g:jedi#goto_command = "<leader>g"

hi SpellBad cterm=underline ctermfg=white

" Edit and save/reload your vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Refresh all buffers in the current vim session.
nmap <leader>gr :bufdo e<CR>

" Mapping to load the sop faster
" nmap <leader>vsop :VirtualEnvActivate sop<CR>

nmap <leader>bd :%bdelete<CR>

" This bit of vim code simply checks to see if the cursor charactor
" can be set in the current terminal mode.  This is useful for when 
" we want to change the cursor when we enter insert mode.
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Enable the horizontal split on CommandT results
" let g:CommandTAcceptSelectionSplitMap=['<CR>', '<C-g>']

" This bit configures the PEP8 Column length
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%101v.\+/

set t_Co=256

"let g:jedi#related_names_command = "<leader>N"
"let g:solarized_termcolors = 256
"let g:solarized_visibility = "high"
"let g:solarized_contrast = "high"
set background=dark
" colorscheme solarized
colorscheme  codeblocks_dark 

"colorscheme 3dglasses

" SnipMate config
autocmd FileType python set ft=python.django " For SnipMate
autocmd FileType html set ft=htmldjango.html " For SnipMate"

let g:csexact_rgbtxt = fnamemodify("~/rgb.txt", ":p")

filetype plugin on

"force html highlighting for files with other extensions
au BufReadPost *.ejs set syntax=html

" Language specific settings
autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab
autocmd FileType javascript set tabstop=2|set shiftwidth=2|set expandtab
