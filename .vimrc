" Use vim defaults.
set nocompatible

" https://github.com/gmarik/Vundle.vim
call plug#begin('~/.vim/plugged')
Plug 'https://github.com/derekwyatt/vim-scala'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'liuchengxu/vista.vim'
Plug 'https://github.com/pedrohdz/vim-yaml-folds'
Plug 'https://github.com/Shougo/vimproc.vim'
Plug 'https://github.com/idanarye/vim-vebugger'
Plug 'https://github.com/majutsushi/tagbar'
Plug 'https://github.com/vim-scripts/L9'
Plug 'https://github.com/vim-scripts/FuzzyFinder'
Plug 'https://github.com/vim-syntastic/syntastic'
Plug 'https://github.com/kshenoy/vim-signature'
Plug 'https://github.com/NLKNguyen/papercolor-theme.git'
Plug 'https://github.com/kien/ctrlp.vim'
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'https://github.com/vimwiki/vimwiki'
Plug 'https://github.com/fatih/vim-go'
Plug 'https://github.com/vim-scripts/RltvNmbr.vim'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/tmsvg/pear-tree'
" cscope
Plug 'https://github.com/simplyzhao/cscope_maps.vim'
" apt-get install ack-grep
Plug 'https://github.com/mileszs/ack.vim'
" ultisnips
Plug 'https://github.com/SirVer/ultisnips'
" Required for Ultisnips:
Plug 'honza/vim-snippets'
" == Snipmate end ==
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" == Airline ==
Plug 'vim-airline/vim-airline'
" === Tabular (equals/arrow alignment) ===
Plug 'https://github.com/godlygeek/tabular'
" == Java ==
" https://github.com/zchee/deoplete-jedi/wiki/Setting-up-Python-for-Neovim
" == Vimspector ==
Plug 'https://github.com/puremourning/vimspector'
call plug#end()

" == Vimspector ==
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'

" Configuration for vim-scala
au BufRead,BufNewFile *.sbt set filetype=scala

" Ultisnips [Note: tab is not usually safe with YouCompleteMe]
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Vista
let g:vista_default_executive = 'coc'

" NERDTree find
nmap <leader>ne :NERDTreeFind<cr><c-w><c-p>

" CtrlP
let g:ctrlp_root_markers = ['.ctrlp']
let g:ctrlp_cmd = 'CtrlPMRU'

" YouCompleteMe [ctrl + p/n setting to not conflict with Ultisnips]
let g:ycm_min_num_of_chars_for_completion = 4
let g:ycm_key_list_select_completion      = ['<C-n>']
let g:ycm_key_list_previous_completion    = ['<C-p>']

" airline
let g:airline#extensions#tabline#enabled = 1

" Happy colours.
syntax on
if has('gui_running') || &t_Co == 256
    set background=dark
    if isdirectory($HOME . "/.vim/plugged/papercolor-theme")
        colorscheme PaperColor
    endif
else
    colorscheme elflord
endif

" Search highlighting.
set hlsearch

" History saved between buffer changes.
set hidden

" Indentation.
set autoindent
filetype plugin indent on

" C programming.
set cindent
set cinoptions=>4

" smoother output.
set ttyfast

" No beeping, No flashing.
set vb t_vb=

" Backups.
set backup
set backupdir=~/.vim/backups

" Tab.
set shiftwidth=4
set tabstop=4

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
set mouse=a

" Chef
autocmd FileType ruby,eruby set filetype=ruby.eruby.chef

" Configuration for coc.nvim (below)

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Some server have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-y>"

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for do codeAction of current line
nmap <leader>ac <Plug>(coc-codeaction)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
