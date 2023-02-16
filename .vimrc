let tokyonight_transparent_background=1
set clipboard=unnamedplus
colorscheme tokyonight
""hi Normal guibg=NONE ctermbg=NONE
""hi LineNr guibg=NONE ctermbg=NONE
set listchars=tab:\|\ 
set list
syntax on
"generic settings
set number
set wrap
set cursorline
set noswapfile
set smartindent
set smartcase
set incsearch
set pastetoggle=<F3>
nnoremap <F2> :SyntasticToggleMode
set path+=**
set wildmenu 
set nocompatible 

" indentation and code folding
set foldmethod=syntax
set autoindent

" auto closing pairs
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap " ""<Esc>i

"Pluins management using vim-plugged
call plug#begin( '~/.vim/plugged' )
Plug 'https://github.com/vim-syntastic/syntastic'
call plug#end()

" code snippets
source $HOME/.vim/myCodeSnippets/latex.vim
source $HOME/.vim/myCodeSnippets/groff.vim
""source $HOME/.vim/myCodeSnippets/c.vim

" go to the next visual line, helpeful when texted is wrapped
nnoremap <up> g<up>
nnoremap g<up> <up>
nnoremap <down> g<down>
nnoremap g<down> <down>
inoremap <up> <C-o>g<up>
inoremap g<up> <C-o><up>
inoremap <down> <C-o>g<down>
inoremap g<down> <C-o><down>

" file specific commands
" compile the current LaTeX file
autocmd FileType tex :map <F4> :w <CR> :!clear && pdflatex "%"<CR>
au BufRead,BufNewFile *.txt,*.tex set wrap linebreak nolist textwidth=0 wrapmargin=0
" indent the current C file, compile it, and run it
autocmd FileType c   :map <F4> :w <CR> :!clear && gcc  % -o %< -lm && ./%<<CR>
autocmd Filetype fortran :map <F4> :w <CR> :!clear && gfortran % -o%< && ./%<<CR>
" automatically recompile LaTeX file when saving
autocmd BufWritePost *.tex !pdflatex --shell-escape %
