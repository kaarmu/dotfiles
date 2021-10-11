" sets.vim, kaarmu
" ==============================================================================
set showmatch       " Show matching braces
set colorcolumn=    " Vertical ruler

set list                        " Show invisible characters, e.g. tabs or eol:s
set listchars=tab:»·,trail:·    " according to this definition

set foldenable      " Enable folding
set fdls=10         " Start with all folds folded
set foldnestmax=3   " More than three folds should not be necessary

set noerrorbells    " No warning sounds ofc
set nu nornu        " Normal numbering at start
set noswapfile      " Don't have stupid swaps
set nobackup        " Don't need backup either
" set undofile        " Default location is XDG_DATA_HOME/nvim/undo
set termguicolors   " Enable 24-bit RGB color in terminal
set signcolumn=number " Always show the sign column
set updatetime=50   " To make vim snappier (?)
set autoread        " Read automatically from outside changes
set enc=utf-8       " vim display encoding
set fenc=utf-8      " output encoding
set modelineexpr    " allow small vim commands at begin/end of file
set mouse=nvi       " enable mouse support in n-v-i modes

set linebreak       " if wrap is on, the line is only visually wrapped
set nowrap          " default behaviour, no wrap
set showbreak=↪     " insert this character at linebreaks
set noshowmode      " Do not display -- MODE -- on command line.
                    " This is already in statusbar -> redundant info
set noruler         " Do not display cursor pos. and etc. Same reason as above

set splitright      " right is the default direction for vspl
set splitbelow      " below is the default direction for spl

" Tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

set scrolloff=4     " The cursor must be at least 4 lines from up/low bound

set backspace=indent,eol,start  " <BS> works on newlines as well
set clipboard+=unnamedplus      " Always use system clipboard, can cause
" slow startup

set nohlsearch  " Start without search highlighting
set incsearch   " Search while writing
set ignorecase  " In combination with...
set smartcase   " Smart case-insensitive search

set completeopt=menuone,noinsert,noselect
set pumheight=10

set exrc
set secure

" ==============================================================================
