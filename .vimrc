syntax on 
colorscheme monokai
set foldmethod=syntax

hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
"set listchars=tab:\|\ 
"set list
au BufRead,BufNewFile *.txt,*.tex set wrap linebreak nolist textwidth=0 wrapmargin=0
set number
set wrap
set noswapfile
set smartindent
set autoindent
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap " ""<Esc>i
set smartcase
set incsearch
set pastetoggle=<F3>
nnoremap <F2> :SyntasticToggleMode
set path+=**
set wildmenu 
:set cursorline

set nocompatible 

"Pluins management using vim-plugged
call plug#begin( '~/.vim/plugged' )
Plug 'https://github.com/vim-syntastic/syntastic'
call plug#end()

" code snippets
source $HOME/.vim/myCodeSnippets/latex.vim
source $HOME/.vim/myCodeSnippets/groff.vim

"Laziness
nnoremap j gj
nnoremap gj j
nnoremap k gk
nnoremap gk k
nnoremap <up> g<up>
nnoremap g<up> <up>
nnoremap <down> g<down>
nnoremap g<down> <down>
inoremap <up> <C-o>g<up>
inoremap g<up> <C-o><up>
inoremap <down> <C-o>g<down>
inoremap g<down> <C-o><down>

" compilers
autocmd FileType tex :map <F4> :w <CR> :!clear && pdflatex "%"<CR>
autocmd FileType c   :map <F4> :w <CR> :!clear && indent -kr -as -br -brf -brs % -o % && gcc  % -o %< -lm && ./%<<CR>
autocmd BufWritePost *.tex !pdflatex %
