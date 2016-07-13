" Use vim defaults.
set nocompatible

" https://github.com/gmarik/Vundle.vim
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'https://github.com/NLKNguyen/papercolor-theme.git'
Plugin 'https://github.com/kien/ctrlp.vim'
Plugin 'https://github.com/scrooloose/nerdtree.git'
Plugin 'https://github.com/vimwiki/vimwiki'
Plugin 'https://github.com/fatih/vim-go'
Plugin 'https://github.com/vim-scripts/RltvNmbr.vim'
" apt-get install ack-grep
Plugin 'https://github.com/mileszs/ack.vim'
" == Snipmate start ==
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
" Optional:
Plugin 'honza/vim-snippets'
" == Snipmate end ==
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
" == Airline ==
Plugin 'vim-airline/vim-airline'
" === Tabular (equals/arrow alignment) ===
Plugin 'https://github.com/godlygeek/tabular'
call vundle#end()

" CtrlP
let g:ctrlp_root_markers = ['.ctrlp']

" Happy colours.
syntax on
if has('gui_running') || &t_Co == 256
    set background=dark
    colorscheme PaperColor
else
    colorscheme elflord
endif

" Search highlighting.
set hlsearch

" Indentation.
set autoindent
filetype plugin indent on

" C programming.
set cindent
set cinoptions=>2

" smoother output.
set ttyfast

" No beeping, No flashing.
set vb t_vb=

" Backups.
set backup
set backupdir=~/.vim/backups

" Tab.
set shiftwidth=2
set tabstop=2

" Turn tabs into spaces
set expandtab

" History.
set history=10000

" Paste toggle.
set pastetoggle=<F11>

" Press F10 to toggle list.
noremap <F10> :set list!<CR>
set listchars=tab:>.
set list

" Press F5 to toggle spell checking.
noremap <F5> :set spell!<CR>
if version >= 700
    set spelllang=en_gb
endif

" Allow vim to open more tab pages
if version >= 700
    set tabpagemax=50
endif

" File encoding.
if &modifiable
    set fenc=utf8
endif

" Trailing whitespace.
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufEnter * match ExtraWhitespace /\s\+$/
if version >= 700
    autocmd ColorScheme * highlight ExtraWhitespace guibg=red
    autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    autocmd InsertLeave * match ExtraWhiteSpace /\s\+$/
endif

" Disable spell checking
set nospell

" Spell check by file type
autocmd FileType mail      set spell
autocmd FileType gitcommit set spell

" Highlight various files.
autocmd BufNewFile,BufRead *.json set filetype=javascript
autocmd BufNewFile,BufRead *.go set filetype=go
autocmd BufNewFile,BufRead /tmp/ldapvi-* set filetype=ldif

" Help keywords
autocmd FileType puppet    set keywordprg=puppet\ describe

" Show current line number ('number') and relative numbers ('relativenumber')
set number
set relativenumber

" Nrformats, which number formats to use (hex, octal, alpha)
set nrformats-=octal

" Status line
highli StatusLine ctermbg=black ctermfg=cyan
set laststatus=2

if has('gui_running')
    " Shift+Ins in gvim.
    map! <s-insert> <c-r>*
endif

" Let ctrl+s save files for me.
noremap  <C-S>              :update<CR>
vnoremap <C-S>         <Esc>:update<CR>
inoremap <C-S>         <Esc>:update<CR>

" Suck in tmux clipboard
noremap  <F12>              :r ~/.tmux-clipboard<CR>
vnoremap <F12>         <C-C>:r ~/.tmux-clipboard<CR>
inoremap <F12>         <C-O>:r ~/.tmux-clipboard<CR>

" Use the mouse for scrolling
set mouse=r
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

" Chef
autocmd FileType ruby,eruby set filetype=ruby.eruby.chef
