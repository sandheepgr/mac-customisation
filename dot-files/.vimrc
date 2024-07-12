" Do not set compatibility 
set nocompatible              " be iMproved, required

" Set the file type off
filetype off                  " required

" Set the :find command to search for a file recursively in the current
" directory
set path+=**

" Set the number
set number

" Set the wildmenu so that we can get suggestions when using wildcard 
set wildmenu

" Turn on the indent based on file type
filetype plugin indent on    " required

" Don't wrap the code
set nowrap " Don't wrap code

" Set the autoindent on
set autoindent

" Set the smart intent on
set smartindent

" Show the matching brackets etc..
set showmatch

" Remove the from format options
set formatoptions-=t

" Enable syntax 
syntax enable

" Set the \r to be the short cut for the reload of the vimrc file
noremap <leader>r :so %<CR>

" Set the \w to be the short cut for saving the file 
noremap <leader>w :w<CR>

" Set the \s to be shortcut for the sudo write
noremap <leader>s :w !sudo tee %<CR>

" Key mapping for copy to system clipboard
noremap <leader>y "+y

" Key mapping for paste from system clipboard
noremap <leader>p "+p

" disable the arrow kes in insert mode
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>

" Disable the arrow keys in normal mode
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>

" Disable the escape key on insert mode ( force to use jk ) 
inoremap <esc> <nop>

" Map jk as the mode switch
inoremap jk  <esc>

" Map th keys for the buffer traversal
nnoremap ,  :bprev<CR>
nnoremap .  :bnext<CR>

" Map the key for the split or window traversal 
nnoremap <tab> <c-w><c-w>

" Map the keys for the tab traveral
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

" Automatic parenthesis closing
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}

" fzf bindings
nnoremap <silent> <C-f> :Files<CR>

" Set the layout for the fzf in vim ( from bottom with 10 lines height ) 
let g:fzf_layout = { 'down': '~40%' }

" Do not set compatibility 
set nocompatible              " be iMproved, required

" Set the file type off
filetype off                  " required

" Set the :find command to search for a file recursively in the current
" directory
set path+=**

" Set the number
set number

" Set the wildmenu so that we can get suggestions when using wildcard 
set wildmenu

" Turn on the indent based on file type
filetype plugin indent on    " required

" Don't wrap the code
set nowrap " Don't wrap code

" Set the autoindent on
set autoindent

" Set the smart intent on
set smartindent

" Show the matching brackets etc..
set showmatch

" Remove the from format options
set formatoptions-=t

" Enable syntax 
syntax enable

" Set the \r to be the short cut for the reload of the vimrc file
noremap <leader>r :so %<CR>

" Set the \w to be the short cut for saving the file 
noremap <leader>w :w<CR>

" Set the \s to be shortcut for the sudo write
noremap <leader>s :w !sudo tee %<CR>

" Key mapping for copy to system clipboard
noremap <leader>y "+y

" Key mapping for paste from system clipboard
noremap <leader>p "+p

" disable the arrow kes in insert mode
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>

" Disable the arrow keys in normal mode
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>

" Disable the escape key on insert mode ( force to use jk ) 
inoremap <esc> <nop>

" Map jk as the mode switch
inoremap jk  <esc>

" Map th keys for the buffer traversal
nnoremap ,  :bprev<CR>
nnoremap .  :bnext<CR>

" Map the key for the split or window traversal 
nnoremap <tab> <c-w><c-w>

" Map the keys for the tab traveral
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

" Automatic parenthesis closing
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}

" fzf bindings
nnoremap <silent> <C-f> :Files<CR>
nmap <C-P> :FZF<CR>
let g:fzf_layout = { 'down': '10' }

" plugins
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
call plug#end()

" Enable airline powerline fonts
let g:airline_powerline_fonts = 1

# Enable the theme as onedark 
# Ref : https://medium.com/@jeantimex/how-to-configure-iterm2-and-vim-like-a-pro-on-macos-e303d25d5b5c
colorscheme onedark
syntax on
set number
highlight Normal ctermbg=None
highlight LineNr ctermfg=DarkGrey
