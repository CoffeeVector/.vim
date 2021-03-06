let mapleader = ","
call plug#begin()
Plug 'https://github.com/junegunn/goyo.vim'
Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/vim-airline/vim-airline-themes.git'
Plug 'https://github.com/Chiel92/vim-autoformat.git'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/udalov/kotlin-vim'
Plug 'https://github.com/pangloss/vim-javascript'
Plug 'https://github.com/mxw/vim-jsx'
Plug 'https://github.com/crusoexia/vim-monokai'
Plug 'https://github.com/neovimhaskell/haskell-vim'
Plug 'https://github.com/lepture/vim-jinja'
call plug#end()

set nocompatible
set ignorecase
set smartcase
set spelllang=en
set number
set relativenumber
"set spell
set clipboard=unnamedplus
set wildmenu
set bg=dark
set expandtab
set tabstop=4
set shiftwidth=4

set inccommand=split

syntax enable
syntax on
filetype plugin on
"color monokai
set tags=tags;

" Make semicolon do the same thing as colon
noremap ; :

let g:autoFormat = 0
function TryAutoFormat(a)
    if a:a
        :Autoformat
    endif
endfunction
autocmd BufWrite * call TryAutoFormat(g:autoFormat)

nnoremap <leader>f :let g:autoFormat = 1 - g:autoFormat <Enter>
nnoremap <leader>p :let lac = 1 - lac <Enter>

" Auto compile latex
let lac = 1
function TryCompile(l)
    if a:l
        !pdflatex --output-directory '%:p:h' % > /dev/null
    endif
endfunction
autocmd Filetype tex,latex
            \ autocmd BufWritePost * silent! call TryCompile(lac)
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE

" set html jinja to html
autocmd BufNewFile,BufRead *.html.jinja set ft=jinja
autocmd BufNewFile,BufRead *.js.jinja set ft=jinja
autocmd BufNewFile,BufRead *.css.jinja set ft=jinja
autocmd BufNewFile,BufRead *.tex.jinja set ft=tex

" insert date with f5
nnoremap <F5> "=strftime("%B %d, %Y")<CR>P
inoremap <F5> <C-R>=strftime("%B %d, %Y")<CR>

" Goyo view
map <leader>g :Goyo \| set linebreak<CR>

" New line without putting into insert mode
nmap <S-CR> O<Esc>
nmap <CR> o<Esc>

" Luke Smith style go to guides
inoremap <leader><leader> <Esc>/<++><Enter>"_c4l
vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
map <leader><leader> <Esc>/<++><Enter>"_c4l

" Latex things
autocmd FileType tex nnoremap <leader>b :r ~/.config/nvim/template/latex/begin-end.template<ENTER>
autocmd FileType tex inoremap <leader>b <Esc>:r ~/.config/nvim/template/latex/begin-end.template<ENTER>i
autocmd FileType tex nnoremap <leader>c :r ~/.config/nvim/template/latex/center.template<ENTER>
autocmd FileType tex inoremap <leader>c <Esc>:r ~/.config/nvim/template/latex/center.template<ENTER>i
autocmd FileType tex nnoremap <leader>em :r ~/.config/nvim/template/latex/emph.template<ENTER>
autocmd FileType tex inoremap <leader>em <Esc>:r ~/.config/nvim/template/latex/emph.template<ENTER>i
autocmd FileType tex nnoremap <leader>i :r ~/.config/nvim/template/latex/itemize.template<ENTER>
autocmd FileType tex inoremap <leader>i <Esc>:r ~/.config/nvim/template/latex/itemize.template<ENTER>i
autocmd FileType tex nnoremap <leader>sec :r ~/.config/nvim/template/latex/section.template<ENTER>
autocmd FileType tex inoremap <leader>sec <Esc>:r ~/.config/nvim/template/latex/section.template<ENTER>i
autocmd FileType tex nnoremap <leader>sub :r ~/.config/nvim/template/latex/subsection.template<ENTER>
autocmd FileType tex inoremap <leader>sub <Esc>:r ~/.config/nvim/template/latex/subsection.template<ENTER>i
autocmd FileType tex nnoremap <leader>ssub :r ~/.config/nvim/template/latex/subsubsection.template<ENTER>
autocmd FileType tex inoremap <leader>ssub <Esc>:r ~/.config/nvim/template/latex/subsubsection.template<ENTER>i
autocmd FileType tex nnoremap <leader>t :r ~/.config/nvim/template/latex/textsuperscript.template<ENTER>
autocmd FileType tex inoremap <leader>t <Esc>:r ~/.config/nvim/template/latex/textsuperscript.template<ENTER>i

" C, Java things
autocmd FileType c,java nnoremap <leader>for :r ~/.config/nvim/template/cjava/for.template<ENTER>
autocmd FileType c,java inoremap <leader>for <Esc>:r ~/.config/nvim/template/cjava/for.template<ENTER>i
autocmd FileType c,java nnoremap <leader>while :r ~/.config/nvim/template/cjava/while.template<ENTER> autocmd FileType c,java inoremap <leader>while <Esc>:r ~/.config/nvim/template/cjava/while.template<ENTER>i
" Calculator
vnoremap <leader>c :!bc -l<ENTER>
