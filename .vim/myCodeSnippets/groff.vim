autocmd BufRead,BufNewFile *.ms,*.me,*.mom set filetype=groff
autocmd Filetype groff inoremap á \*[']a
autocmd Filetype groff inoremap Á \*[']A
autocmd Filetype groff inoremap é \*[']e
autocmd Filetype groff inoremap è \*[`]e
autocmd Filetype groff inoremap É \*[']E
autocmd Filetype groff inoremap í \*[']i
autocmd Filetype groff inoremap Í \*[']I
autocmd Filetype groff inoremap ó \*[']o
autocmd Filetype groff inoremap Ó \*[']O
autocmd Filetype groff inoremap ú \*[']u
autocmd Filetype groff inoremap Ú \*[']U
