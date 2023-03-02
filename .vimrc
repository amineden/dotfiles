let tokyonight_transparent_background=1
set clipboard=unnamedplus
 nnoremap <C-c> "+y
 vnoremap <C-c> "+y
 nnoremap <C-p> "+p
 let g:ale_python_flake8_options = '--max-line-length=120'
 vnoremap <C-p> "+p
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
set smartcase
set incsearch
set pastetoggle=<F3>
set path+=**
set wildmenu 
set nocompatible 
set tabstop=4
set shiftwidth=4
set expandtab
" indentation and code folding
set foldmethod=syntax
""autocmd FileType python setlocal foldmethod=indent
""autocm FileType pythin setlocal set foldlevel=99
set autoindent

" auto closing pairs
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap " ""<Esc>i

"Pluins management using vim-plugged
call plug#begin( '~/.vim/plugged' )
Plug 'dense-analysis/ale'
Plug 'tmhedberg/SimpylFold'
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
autocmd Filetype python :map <F4> :w <CR> :!clear && python %<CR>
" automatically recompile LaTeX file when saving
autocmd BufWritePost *.tex !pdflatex --shell-escape %
