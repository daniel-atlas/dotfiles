filetype plugin indent on
set encoding=utf-8
set nocompatible
set tabstop=4
syntax on
set background=dark

lan mes ru_RU.UTF-8

" Cyrillic in the menu 
source $VIMRUNTIME/delmenu.vim
set langmenu=ru_RU.UTF-8
source $VIMRUNTIME/menu.vim

" Plugins
call plug#begin('~/.vim/bundle')
Plug 'ErichDonGubler/vim-sublime-monokai'	
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'kien/rainbow_parentheses.vim'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-operator-user'
Plug 'vim-syntastic/syntastic'
Plug 'Valloric/YouCompleteMe'
Plug 'neomake/neomake'
Plug 'matze/vim-move'
call plug#end()

" Color scheme 
colorscheme sublimemonokai
set guifont=Hack:h10

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#keymap#enabled = 0
let g:airline_section_z = "\ue0a1:%l/%L Col:%c"
let g:Powerline_symbols='unicode'
let g:airline#extensions#xkblayout#enabled = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" Standart options
set showtabline=0
set number
set wrap linebreak nolist
set textwidth=80
set cursorline

" Cursor changes in different modes
set ttimeoutlen=10
let &t_SI.="\e[5 q" "SI = insert mode 
let &t_SR.="\e[3 q" "SR = replace mode
let &t_EI.="\e[1 q" "EI = normal mode 

" Russification
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0

" YCM settings
let g:ycm_show_diagnostics_ui = 0
set completeopt-=preview

" Neomake settings
let g:neomake_cpp_clang_maker = {
   \ 'exe': 'clang++',
   \ 'args': ['-I/usr/local/include/wx-3.0', '-std=c++17'],
   \ }

" clang-format
augroup clangFormat
autocmd!
	autocmd BufWritePre *.cpp,*.h,*.hpp,*.c :%py3f ~/.vim/clang-format.py
augroup END

" Move lines
let g:move_key_modifier = 'C'

" Key mappings
nmap <C-n> :NERDTreeToggle<CR>

" Rainbow parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
