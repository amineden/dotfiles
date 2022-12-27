syntax on 
colorscheme monokai
hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
set listchars=tab:\|\ 
set list
au BufRead,BufNewFile *.txt,*.tex set wrap linebreak nolist textwidth=0 wrapmargin=0
set number
set nowrap
set noswapfile
set smartindent
set smartcase
set incsearch
set pastetoggle=<F3>
nnoremap <F2> :SyntasticToggleMode
set path+=**
set wildmenu 
:set cursorline

set nocompatible 

"Pluins management using vim-plugged
"call plug#begin( '~/.vim/plugged' )
"Plug 'mattn/emmet-vim'
"Plug 'https://github.com/WolfgangMehner/bash-support.git'
"Plug 'https://github.com/vim-syntastic/syntastic'
"call plug#end()

"emmet
"let g:user_emmet_mode='a'
"let g:user_emmet_leader_key = '<c-n>'
"
"filetype plugin on 
""c-support
""call mmtemplates#config#Add ( 'C', '/home/amine/.vim/plugged/c-support/c-support/templates/doxygen.templates', 'Doxygen', 'ntd' )
""call mmtemplates#config#Add ( 'C', '~/.vim/c-support/c-support/templates/doxygen.template', 'Doxygen', 'ntd' )
"call mmtemplates#config#Add ( 'C', '~/.vim/c-support/templates/doxygen.template', 'Doxygen', 'ntd' )
"let g:C_UseTool_cmake    = 'yes'
"let g:C_UseTool_doxygen  = 'yes'

"Custom templates for writing code
source $HOME/.vim/emplates/latex.vim
source $HOME/.vim/emplates/shell.vim
source $HOME/.vim/emplates/html.vim
source $HOME/.vim/emplates/groff.vim



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

