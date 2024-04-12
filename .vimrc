" Plugins management using vim-plug
call plug#begin('~/.vim/plugged')
Plug 'dense-analysis/ale'
""Plug 'ycm-core/YouCompleteMe'
Plug 'tmhedberg/SimpylFold'
call plug#end()

" Generic settings
set nocompatible
set number
set wrap
set cursorline
set noswapfile
set smartcase
set incsearch
set pastetoggle=<F3>
set path+=**
set wildmenu
set tabstop=4
set shiftwidth=4
set expandtab
set sessionoptions+=cursor


" Syntax highlighting and indentation
syntax on
set listchars=tab:\|\ 
set list
set autoindent
set foldmethod=syntax

" Color scheme
let tokyonight_transparent_background = 1
colorscheme tokyonight

" Clipboard
set clipboard=unnamedplus

" Toggle auto closing pairs
let g:auto_close_pairs_enabled = 1

function! ToggleAutoClosePairs()
    if g:auto_close_pairs_enabled
        inoremap ( ()<Esc>i
        inoremap [ []<Esc>i
        inoremap { {}<Esc>i
        inoremap " ""<Esc>i
        let g:auto_close_pairs_enabled = 0
        echo "Auto closing pairs enabled"
    else
        iunmap (
        iunmap [
        iunmap {
        iunmap "
        let g:auto_close_pairs_enabled = 1
        echo "Auto closing pairs disabled"
    endif
endfunction

" Map F5 to toggle auto closing pairs
noremap <F5> :call ToggleAutoClosePairs()<CR>

" Snippets
source $HOME/.vim/myCodeSnippets/latex.vim
source $HOME/.vim/myCodeSnippets/groff.vim
""source $HOME/.vim/myCodeSnippets/c.vim

" ALE settings
let g:ale_python_flake8_options = '--max-line-length=120'

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 1

" Custom mappings
nnoremap <C-c> "+y
vnoremap <C-c> "+y
nnoremap <C-p> "+p
vnoremap <C-p> "+p
nnoremap <up> g<up>
nnoremap g<up> <up>
nnoremap <down> g<down>
nnoremap g<down> <down>
inoremap <up> <C-o>g<up>
inoremap g<up> <C-o><up>
inoremap <down> <C-o>g<down>
inoremap g<down> <C-o><down>

" File specific commands
" Compile the current LaTeX file
autocmd FileType tex nnoremap <F4> :w <Bar> !clear && pdflatex "%" <CR>
" Set text wrapping and indentation for txt and tex files
autocmd BufRead,BufNewFile *.txt,*.tex set wrap linebreak nolist textwidth=0 wrapmargin=0
" Indent the current C file, compile it, and run it
autocmd FileType c nnoremap <F4> :w <Bar> !clear && gcc % -o %< -lm && ./%< <CR>
autocmd Filetype fortran nnoremap <F4> :w <Bar> !clear && gfortran % -o%< && ./%< <CR>
autocmd Filetype python nnoremap <F4> :w <Bar> !clear && python "%" <CR>
autocmd Filetype mermaid nnoremap <F4> :w <Bar> !clear && mmdc -i "%" -o %:r.png <CR>
" Automatically recompile LaTeX file when saving
autocmd BufWritePost *.tex !pdflatex --shell-escape %

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

"Toggle YouCompleteMe on and off with F2
function Toggle_ycm()
    if g:ycm_show_diagnostics_ui == 0
        let g:ycm_auto_trigger = 1
        let g:ycm_show_diagnostics_ui = 1
        :YcmRestartServer
        :e
        :echo "YCM on"
    elseif g:ycm_show_diagnostics_ui == 1
        let g:ycm_auto_trigger = 0
        let g:ycm_show_diagnostics_ui = 0
        :YcmRestartServer
        :e
        :echo "YCM off"
    endif
endfunction
map <F2> :call Toggle_ycm() <CR>

