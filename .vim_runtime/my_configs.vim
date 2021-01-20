"show line number
":set number relativenumber
set nu

" mouse scroll
:set mouse=a

nmap <space> <Nop>
nmap <C-space> <Nop>

if (has("gui_running"))
    let s:c = ",undercurl"
else
    let s:c = ",underline"
endif

"
"For latex
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" If you use XeTex
let g:Tex_CompileRule_pdf = 'xelatex -synctex=1 -src-specials --interaction=nonstopmode $*'
let g:Tex_CompileRule_nls = 'makeindex $*.nlo -s nomencl.ist $*.nls'

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats='pdf,bib,pdf'

" ser pdf viewer (for windows only)
let g:Tex_ViewRule_pdf = 'okular'

let g:Tex_GotoError = 0

" let g:Tex_package_detected = 'graphicx'

" let g:Tex_Env_figure="\\begin{figure}[<+htpb+>]\<cr>\\centering\<cr>\\includegraphics[width=<+width+>]{<+file+>}\<cr>\\caption{<+caption text+>}\<cr>\\label{fig:<+label+>}\<cr>\\end{figure}<++>"

" function! SyncTexForward()
" let linenumber=line(".")
" let colnumber=col(".")
" let filename=fnamemodify(bufname("%"), ":p")
" let filenamePDF="/media/Data/IBM/papers/thesis/Dissertation_LaTeX_Template/thesis.pdf"
" let execstr="silent !evince --synctex-forward " . linenumber . ":" . colnumber . ":" . filename . " " . filenamePDF . "&>/dev/null &"
" exec execstr
" endfunction
" nmap <Leader>q :call SyncTexForward()<CR>

"for color scheme spell check in vim
hi SpellBad    ctermfg=160      ctermbg=000     cterm=underline      guifg=#FFFFFF   guibg=#000000   gui=underline

" "Nerd commenter
" " Add spaces after comment delimiters by default
" let g:NERDSpaceDelims = 1
"
" " Use compact syntax for prettified multi-line comments
" let g:NERDCompactSexyComs = 1
"
" " Align line-wise comment delimiters flush left instead of following code indentation
" let g:NERDDefaultAlign = 'left'
"
" " Set a language to use its alternate delimiters by default
" let g:NERDAltDelims_java = 1
"
" " Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
"
" " Allow commenting and inverting empty lines (useful when commenting a region)
" let g:NERDCommentEmptyLines = 1
"
" " Enable trimming of trailing whitespace when uncommenting
" let g:NERDTrimTrailingWhitespace = 1
"
" " Enable NERDCommenterToggle to check all selected lines is commented or not
" let g:NERDToggleCheckAllLines = 1

" get ride of mode show due to status line
set noshowmode

" spell check do not highlight code
syntax enable

:map <F4> :set spell!<CR>

"let vim use system clipboard
set clipboard=unnamedplus

" Stop vim automatically continues to comment on the new lines
au FileType * set fo-=c fo-=r fo-=o

" c++ compile
:nmap <F6> :!make<CR><CR>

" disable cursor blink in gvim
set guicursor+=a:blinkon0
highlight Cursor guibg=green

" " set ctags from ctags -R
" set tags+=/media/Data/IBM/ibm-v1812/src/tags
" set tags+=/media/Data/IBM/ibm-v1812/applications/tags
" set tags+=/home/haixuan/OpenFOAM/OpenFOAM-v1812/tags

set belloff=all

" set compile and run
:nnoremap <F9> :w<CR>:!g++ -O3 -o %:r %<CR>
:nnoremap <S-F9> :w<CR>:!g++ -O0 -g -o %:r %<CR>
:nnoremap <F10> :!./%:r<CR>
:set shortmess=a

function AddTitle()
    call setline(1,"/********************************************************")
    call append(1,"*")
    call append(2,"*  "."Author: Hx Ye - hxye@umich.edu")
    call append(3,"*")
    call append(4,"*  "."Create: " . strftime("%Y-%m-%d %H:%M"))
    call append(5,"*")
    call append(6,"*  "."Last modified: " . strftime("%Y-%m-%d %H:%M"))
    call append(7,"*")
    call append(8,"*  "."Filename: ".expand("%:t"))
    call append(9,"*")
    call append(10,"*  "."Description: ")
    call append(11,"*")
    call append(12,"********************************************************/")
    call append(13," ")
    call append(14,"#include <bits/stdc++.h>")
    call append(15," ")
    call append(16,"using namespace std;")
    call append(17," ")
    call append(18,"int main() {")
    call append(19," ")
    call append(20,"    return 0;")
    call append(21,"}")
endfunction
:nnoremap <F7> :call AddTitle()<CR>
:nmap <F8> :/#*Last modified:/s@:.*$@\=strftime(": %Y-%m-%d %H:%M")@<CR>,<CR>

set cindent
set cinoptions=g1,N-4,+0

"autocmd BufEnter *.m compiler mlint

nnoremap gh <C-w>f<C-w>H

nmap <silent> <c-n> :lprevious<cr>
nmap <silent> <c-m> :lnext<cr>

hi Normal guibg=NONE ctermbg=NONE


