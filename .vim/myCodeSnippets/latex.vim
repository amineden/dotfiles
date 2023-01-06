autocmd Filetype tex inoremap <C-@><C-@> <Esc>/<++><Enter>"_c4l
autocmd Filetype tex inoremap ;f \frac{<++>}{<++>}<++><Esc>F_ciw
autocmd Filetype tex inoremap ;int \int_{}^{<++>}<++>\:\marthm{d<++>}<++><Esc>F_lli
autocmd Filetype tex inoremap ;fig \begin{figure}[H]<Return>\centering<Return>\includegraphics[width=9cm]{_}<Return>\caption{<++>}<Return>\end{figure}<Return><++><Esc>kkkf_ciw
autocmd Filetype tex inoremap ;_ \textsubscript{_}<++><Esc>F_ciw
autocmd Filetype tex inoremap ;^ \textsuperscript{_}<++><Esc>F_ciw
autocmd Filetype tex inoremap ;\ \[_\]<Esc>F_ciw
autocmd Filetype tex inoremap ;m \mathrm{_}<++><Esc>F_ciw
autocmd Filetype tex inoremap ;s \sqrt{_}<++><Esc>F_ciw
autocmd Filetype tex inoremap ;em \emph{_}<++><Esc>F_ciw
autocmd Filetype tex inoremap ;b \textbf{_}<++><Esc>F_ciw
autocmd Filetype tex inoremap ;fr \begin{flushright}_\end{flushright}<Return><++><Esc>kf_ciw
autocmd Filetype tex inoremap ;fl \begin{flushleft}_\end{flushleft}<Return><++><Esc>kf_ciw
autocmd Filetype tex inoremap ;c \begin{center}_\end{center}<Return><Backspace><++><Esc>kf_ciw
autocmd Filetype tex inoremap $$ \[__\]<Return><++><Esc>kF_ciw
autocmd Filetype tex inoremap ;eq \begin{equation}\label{__}<Return><++><Return>\end{equation}<Return><++><Esc>kkkf_ciw
