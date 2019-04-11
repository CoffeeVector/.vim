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
call plug#end()

set nocompatible
set ignorecase
set smartcase
set spelllang=en
set number
set relativenumber
set spell
set clipboard=unnamedplus
set wildmenu
set bg=dark
syntax enable
syntax on
filetype plugin on
color monokai
" Make semicolon do the same thing as colon
noremap ; :

" Automatically reformat before write. TODO: MAKE A WAY TO NOT DO THIS WHEN I
" DON'T WANT IT TO
autocmd BufWrite * :Autoformat

" Auto compile latex
autocmd Filetype tex,latex
			\ autocmd BufWritePost * silent! !pdflatex --output-directory '%:p:h' % > /dev/null
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE
nnoremap <F5> "=strftime("%B %d, %Y")<CR>P
inoremap <F5> <C-R>=strftime("%B %d, %Y")<CR>

" Goyo view
map <leader>f :Goyo \| set linebreak<CR>

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
autocmd FileType c,java nnoremap <leader>while :r ~/.config/nvim/template/cjava/while.template<ENTER>
autocmd FileType c,java inoremap <leader>while <Esc>:r ~/.config/nvim/template/cjava/while.template<ENTER>i
