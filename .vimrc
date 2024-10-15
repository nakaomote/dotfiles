" Use vim defaults.
set nocompatible

" Yank to clipboard
set clipboard=unnamedplus

" disable netrw
lua vim.g.loaded_netrw = 1
lua vim.g.loaded_netrwPlugin = 1

" https://github.com/gmarik/Vundle.vim
call plug#begin('~/.vim/plugged')
Plug 'https://github.com/derekwyatt/vim-scala'

" Better quickfix
Plug 'kevinhwang91/nvim-bqf', { 'ft': 'qf' }

" Mason (LSP automation)
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
" LSP Support
Plug 'neovim/nvim-lspconfig'

" Autocompletion
Plug 'hrsh7th/nvim-cmp'
" Function signature completions
Plug 'https://github.com/hrsh7th/cmp-nvim-lsp-signature-help'
" LSP
Plug 'hrsh7th/cmp-nvim-lsp'
" buffer words
Plug 'https://github.com/hrsh7th/cmp-buffer'
" Snippets
Plug 'https://github.com/saadparwaiz1/cmp_luasnip'
" Friendly snippets
Plug 'rafamadriz/friendly-snippets'
" LuaSnip
Plug 'L3MON4D3/LuaSnip', {'tag': 'v2.*', 'do': 'make install_jsregexp'}
" lsp-zero
Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v3.x'}

" illuminate
Plug 'https://github.com/RRethy/vim-illuminate'

"fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'liuchengxu/vista.vim'
Plug 'https://github.com/pedrohdz/vim-yaml-folds'
Plug 'https://github.com/Shougo/vimproc.vim'
Plug 'https://github.com/idanarye/vim-vebugger'
Plug 'https://github.com/majutsushi/tagbar'
Plug 'https://github.com/vim-scripts/L9'
Plug 'https://github.com/vim-scripts/FuzzyFinder'
Plug 'https://github.com/vim-syntastic/syntastic'
Plug 'https://github.com/kien/ctrlp.vim'
Plug 'https://github.com/vim-scripts/RltvNmbr.vim'
Plug 'https://github.com/mfussenegger/nvim-dap'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'https://github.com/mfussenegger/nvim-dap-ui'
Plug 'https://github.com/leoluz/nvim-dap-go'
Plug 'ojroques/vim-oscyank', {'branch': 'main'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'olexsmir/gopher.nvim'

" golang
Plug 'ray-x/go.nvim'
Plug 'ray-x/guihua.lua'

Plug 'folke/flash.nvim'
Plug 'https://github.com/bluz71/vim-nightfly-colors'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'https://github.com/nvim-tree/nvim-tree.lua'
Plug 'https://github.com/chentoast/marks.nvim'
" cscope
Plug 'https://github.com/simplyzhao/cscope_maps.vim'
" apt-get install ack-grep
Plug 'https://github.com/mileszs/ack.vim'
" Required for Ultisnips:
Plug 'honza/vim-snippets'
" == Snipmate end ==
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'airblade/vim-gitgutter'
" == Airline ==
Plug 'vim-airline/vim-airline'
" === Tabular (equals/arrow alignment) ===
Plug 'https://github.com/godlygeek/tabular'

" Trailblazer
Plug 'LeonHeidelbach/trailblazer.nvim'

call plug#end()

" Configuration for vim-scala
au BufRead,BufNewFile *.sbt set filetype=scala

" Ultisnips [Note: tab is not usually safe with YouCompleteMe]
let g:UltiSnipsExpandTrigger=""
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" CtrlP
let g:ctrlp_root_markers = ['.ctrlp']
let g:ctrlp_cmd = 'CtrlPBuffer'

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
    colorscheme nightfly
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

" Use the mouse for scrolling
set mouse=a

" Chef
autocmd FileType ruby,eruby set filetype=ruby.eruby.chef

" Some server have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

nmap <leader>c <Plug>OSCYankOperator
nmap <leader>cc <leader>c_
vmap <leader>c <Plug>OSCYankVisual

autocmd FileType go setlocal noexpandtab

lua require('nvim-treesitter.configs').setup({ ensure_installed = { "go", "bash", "python", "dockerfile", }, highlight = { enable = true }, })

lua vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
lua vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
lua vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
lua vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
lua vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
lua vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
lua vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
lua vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
lua vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
lua vim.keymap.set({'n', 'v'}, '<Leader>dh', function() require('dap.ui.widgets').hover() end)
lua vim.keymap.set({'n', 'v'}, '<Leader>dp', function() require('dap.ui.widgets').preview() end)
lua vim.keymap.set('n', '<Leader>df', function() local widgets = require('dap.ui.widgets') widgets.centered_float(widgets.frames) end)
lua vim.keymap.set('n', '<Leader>ds', function() local widgets = require('dap.ui.widgets') widgets.centered_float(widgets.scopes) end)

" nvim-treee
"lua vim.opt.termguicolors = true
lua require("nvim-tree").setup({ update_focused_file = { enable = true, }, })

" flash
lua require("flash").setup()
lua vim.keymap.set('o', 'r', function() require('flash').remote() end)
lua vim.keymap.set({'n', 'o', 'x'}, '<Leader>s', function() require('flash').treesitter_search() end)
lua vim.keymap.set({'n', 'o', 'x'}, '<c-s>', function() require('flash').treesitter() end)

" Last and next jump should center too.
nnoremap <C-o> <C-o>zz
nnoremap <C-i> <C-i>zz

" start nvim-tree
autocmd VimEnter *.go NvimTreeOpen

" close quickfix window:
autocmd FileType qf nnoremap <buffer> <CR> <CR>:cclose<CR>
