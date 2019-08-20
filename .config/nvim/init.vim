syntax on
set number relativenumber
set encoding=utf-8
set linebreak
set expandtab autoindent tabstop=4 shiftwidth=4

if !&scrolloff
	set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
	set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif

set wildmode=longest,list,full

set splitbelow splitright

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
