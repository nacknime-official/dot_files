" ============================================================================
" Vim-plug initialization

" vim-plug init {{{
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif
" vim-plug init }}}

" Plugins {{{
call plug#begin('~/.config/nvim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'neovim/nvim-lsp'
"Plug 'haorenW1025/completion-nvim'
"Plug 'haorenW1025/diagnostic-nvim'
"Plug 'steelsojka/completion-buffers'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Code commenter
Plug 'scrooloose/nerdcommenter'

" Class/module browser
Plug 'preservim/tagbar'

" Lightline
Plug 'itchyny/lightline.vim'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Pending tasks list
"Plug 'fisadev/FixedTaskList.vim'

" Automatically close parenthesis, etc
Plug 'jiangmiao/auto-pairs'

" Surround
Plug 'tpope/vim-surround'

"" Indent text object
"Plug 'michaeljsmith/vim-indent-object'

"" Indentation based movements
Plug 'Yggdroot/indentLine'

" Better language packs
"Plug 'sheerun/vim-polyglot'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate', 'commit': '6d504dd0f866d7c7337025f8f27b1d84a993b4a3'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
"Plug 'romgrk/nvim-treesitter-context'

" Paint css colors with the real color
Plug 'norcalli/nvim-colorizer.lua'

" Generate html in a simple way
Plug 'mattn/emmet-vim', { 'for': 'html' }

" Git integration
Plug 'tpope/vim-fugitive'

Plug 'vim-scripts/argtextobj.vim'

Plug 'arcticicestudio/nord-vim'
Plug 'gruvbox-community/gruvbox'
Plug 'joshdick/onedark.vim'
"Plug 'rakr/vim-one'
Plug 'lifepillar/vim-gruvbox8'
Plug 'tpope/vim-obsession'
" markdown
Plug 'godlygeek/tabular', { 'for': 'markdown' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install', 'for': 'markdown' }
Plug 'ferrine/md-img-paste.vim'

" Python folding
Plug 'Konfekt/FastFold'

Plug 'puremourning/vimspector' | let g:vimspector_enable_mappings = 'VISUAL_STUDIO'

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

Plug 'wsdjeg/vim-todo'

"Plug 'mhinz/vim-startify'
"Plug 'glepnir/dashboard-nvim'
Plug 'goolord/alpha-nvim'

" Bar
Plug 'romgrk/barbar.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" CSV support
Plug 'chrisbra/csv.vim', { 'for': 'csv' }

" Live HTML server
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}

" AsyncTasks
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim' | let g:asyncrun_open = 6

" Database manager with autocomplete (coc-db)
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'

Plug 'jdhao/better-escape.vim'

Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'fannheyward/telescope-coc.nvim'

Plug 'folke/todo-comments.nvim'
Plug 'folke/trouble.nvim'

"Plug 'chaoren/vim-wordmotion'
Plug 'lifepillar/vim-colortemplate'
Plug 'kyazdani42/nvim-tree.lua'

Plug 'Vimjas/vim-python-pep8-indent'

Plug 'wakatime/vim-wakatime'

Plug 'michaelb/sniprun', {'do': 'bash install.sh'}
Plug 'nvim-telescope/telescope-project.nvim'
Plug 'rmagatti/auto-session'
Plug 'rmagatti/session-lens'
Plug 'folke/tokyonight.nvim'
call plug#end()
" end plugins }}}


lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "python",
  highlight = {
   enable = true,
    -- use_languagetree = true,
  },
  indent = {
    enable = false,
  },
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim 
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",

        -- Or you can define your own textobjects like this
        ["iF"] = {
          python = "(function_definition) @function",
          cpp = "(function_definition) @function",
          c = "(function_definition) @function",
          java = "(method_declaration) @function",
        },
      },
    },
  },
}
require("todo-comments").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
}
require("trouble").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
}
require('telescope').load_extension('coc')
--require('telescope').load_extension('sessions')
require("telescope").load_extension("session-lens")
require('telescope').load_extension('project')

local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close
      },
    },
  }
}
EOF

let mapleader = ','
" ============================================================================
" Vim settings and mappings
" You can edit them as you wish

" tabs and spaces handling
set expandtab
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround

set autoindent                    " take indent for new line from previous line
set smartindent                   " enable smart indentation
"set list                          " show trailing whitespace
",trail:▫
" show line numbers
set nu
set termguicolors
set ignorecase
set scrolloff=7
"set foldmethod=marker foldlevel=0
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevel=99
set hidden
set autoread " detect when a file is changed
set smartcase " case-sensitive if expresson contains a capital letter
set hlsearch " highlight search results
set incsearch " set incremental search, like modern browsers
set nolazyredraw " don't redraw while executing macros
set magic " Set magic on, for regex

" error bells
set noerrorbells
set visualbell
set t_vb=
set tm=500

set ttyfast " faster redrawing

    
set shell=$SHELL
set cmdheight=1 " command bar height
set title " set terminal title
set showmatch " show matching braces

set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors

set concealcursor=c " disable concealing when cursor on the line
set conceallevel=2

set mouse=a
set updatetime=300
set signcolumn=yes

set sessionoptions+=options,resize,winpos,terminal
set sessionoptions-=blank " fix blank coc-explorer windows after reopening session
" switch cursor to line when in insert mode, and block when not

" enable 24 bit color support if supported
if (has("termguicolors"))
    if (!(has("nvim")))
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    endif
    set termguicolors
endif
lua require'colorizer'.setup()

" highlight conflicts
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
" remove ugly vertical lines on window division
"set fillchars+=vert:\ 

" keyboard layout switcher (for Sway, depends on a system)
au InsertLeave * let lastLangIndex=system('swaymsg -t get_inputs | grep -m1 "xkb_active_layout_index" | grep -oP "\d+"') | call jobstart('swaymsg input "* xkb_switch_layout 0"')
au InsertEnter * :if exists("lastLangIndex") | call jobstart('swaymsg input "* xkb_switch_layout ' . lastLangIndex . '"') | endif

" colorscheme {{{
let g:gruvbox_bold = 0
let g:gruvbox_italic = 1
let g:gruvbox_contrast_dark = "hard"
let g:gruvbox_invert_selection = 0
let g:gruvbox_sign_column = "dark0_hard"
let g:onedark_terminal_italics = 1
colorscheme gruvbox8_hard
set background=dark

hi SignColumn ctermbg=none guibg=none
"let g:material_theme_style = 'dark'
"let g:one_allow_italics = 1
" colorscheme }}}

" save as sudo
ca w!! w !sudo tee "%"

" tab navigation mappings & BarBar settings
map tt :tabnew 
map  <silent> <A-l>         :BufferNext<CR>
imap <silent> <A-l> <ESC>   :BufferNext<CR>
map  <silent> <A-h>         :BufferPrevious<CR>
imap <silent> <A-h> <ESC>   :BufferPrevious<CR>
map  <silent> <A-S-h>       :BufferMovePrevious<CR>
map  <silent> <A-S-l>       :BufferMoveNext<CR>
imap  <silent> <A-S-h> <ESC>      :BufferMovePrevious<CR> i
imap  <silent> <A-S-l> <ESC>      :BufferMoveNext<CR> i

nnoremap <silent>    <A-1>  :BufferGoto 1<CR>
nnoremap <silent>    <A-2>  :BufferGoto 2<CR>
nnoremap <silent>    <A-3>  :BufferGoto 3<CR>
nnoremap <silent>    <A-4>  :BufferGoto 4<CR>
nnoremap <silent>    <A-5>  :BufferGoto 5<CR>
nnoremap <silent>    <A-6>  :BufferGoto 6<CR>
nnoremap <silent>    <A-7>  :BufferGoto 7<CR>
nnoremap <silent>    <A-8>  :BufferGoto 8<CR>
nnoremap <silent>    <A-9>  :BufferLast<CR>
nnoremap <silent>    <A-c>  :BufferClose<CR>

let bufferline = {}
let bufferline.auto_hide = v:true
let bufferline.icons = "both"

" clear search results
nnoremap <silent> // :noh<CR>

" shortcut to save
nmap <leader>, :w<cr>

" keep visual selection when indenting/outdenting
vmap < <gv
vmap > >gv

" toggle cursor line
nnoremap <leader>i :set cursorline!<cr>

" scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" moving between windows easier
map <silent> <C-h> <C-w>h
map <silent> <C-j> <C-w>j
map <silent> <C-k> <C-w>k
map <silent> <C-l> <C-w>l

nmap <silent> <C-Up> :resize -2<CR>
nmap <silent> <C-Down> :resize +2<CR>
nmap <silent> <C-Left> :vertical resize -2<CR>
nmap <silent> <C-Right> :vertical resize +2<CR>
" height of the complete window
set pumheight=15
" Ability to add python breakpoints
" (I use ipdb, but you can change it to whatever tool you use for debugging)
au FileType python nnoremap <silent><nowait> <leader>b O__import__("ipdb").set_trace()<esc>

" ============================================================================
" Plugins settings and mappings
" Edit them as you wish.

" Tagbar -----------------------------

" toggle tagbar display
map <F4> :TagbarToggle<CR>
" autofocus on tagbar open
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0

" CocExplorer -----------------------------

" toggle coc_explorer display
map <F3> :CocCommand explorer --sources=buffer-,file+<CR>

" Tasklist ------------------------------

" show pending tasks list
"map <F2> :TaskList<CR>
let g:lightline = {
    \ 'colorscheme': 'gruvbox8',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'git', 'diagnostic', 'readonly', 'filename', 'modified' ] ],
    \   'right': [ [ 'lineinfo' ], [ 'percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
    \ },
    \
    \ 'component_function': {
    \   'cocstatus': 'coc#status'
    \ },
    \ 'mode_map': {
        \ 'n' : 'N',
        \ 'i' : 'I',
        \ 'R' : 'R',
        \ 'v' : 'V',
        \ 'V' : 'VL',
        \ "\<C-v>": 'VB',
        \ 'c' : 'C',
        \ 's' : 'S',
        \ 'S' : 'SL',
        \ "\<C-s>": 'SB',
        \ 't': 'T',
        \ },
    \ }



" Fzf ------------------------------

" file finder mapping
"nmap <leader>e :Files<CR>
"" tags (symbols) in current file finder mapping
"nmap g :BTag<CR>
"" tags (symbols) in all files finder mapping
"nmap ,G :Tags<CR>
"" general code finder in current file mapping
"nmap ,f :BLines<CR>
"" general code finder in all files mapping
"nmap ,F :Lines<CR>
"" commands finder mapping
"nmap ,c :Commands<CR>
""to be able to call CtrlP with default search text
"function! CtrlPWithSearchText(search_text, ctrlp_command_end)
    "execute ':CtrlP' . a:ctrlp_command_end
    "call feedkeys(a:search_text)
"endfunction
""same as previous mappings, but calling with current word as default text
"nmap ,wg :call CtrlPWithSearchText(expand('<cword>'), 'BufTag')<CR>
"nmap ,wG :call CtrlPWithSearchText(expand('<cword>'), 'BufTagAll')<CR>
"nmap ,wf :call CtrlPWithSearchText(expand('<cword>'), 'Line')<CR>
"nmap ,we :call CtrlPWithSearchText(expand('<cword>'), '')<CR>
"nmap ,pe :call CtrlPWithSearchText(expand('<cfile>'), '')<CR>
"nmap ,wm :call CtrlPWithSearchText(expand('<cword>'), 'MRUFiles')<CR>
"nmap ,wc :call CtrlPWithSearchText(expand('<cword>'), 'CmdPalette')<CR>


" Window Chooser ------------------------------

" mapping
"nmap  -  <Plug>(choosewin)
" show big letters
"let g:choosewin_overlay_enable = 1

" Signify ------------------------------

" this first setting decides in which order try to guess your current vcs
" UPDATE it to reflect your preferences, it will speed up opening files
let g:signify_vcs_list = [ 'git', 'hg' ]
" mappings to jump to changed blocks
nmap <leader>sn <plug>(signify-next-hunk)
nmap <leader>sp <plug>(signify-prev-hunk)
" nicer colors
highlight SignifySignAdd    ctermfg=114 guifg=#98C379
highlight SignifySignDelete ctermfg=180 guifg=#E5C07B
highlight SignifySignChange ctermfg=204 guifg=#E06C75

" move lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

let g:python3_host_prog = '/usr/bin/python3'


let g:coc_global_extensions = [
    \ 'coc-json',
    \ 'coc-tsserver',
    \ 'coc-git',
    \ 'coc-eslint',
    \ 'coc-tslint-plugin',
    \ 'coc-sh',
    \ 'coc-vimlsp',
    \ 'coc-emmet',
    \ 'coc-prettier',
    \ 'coc-snippets',
    \ 'coc-explorer',
    \ 'coc-diagnostic',
    \ 'coc-terminal',
    \ 'coc-tasks',
    \ 'coc-project',
    \ 'coc-marketplace',
    \ 'coc-html',
    \ 'coc-html-css-support',
    \ 'coc-gitignore',
    \ 'coc-gist',
    \ 'coc-fzf-preview',
    \ 'coc-emoji',
    \ 'coc-db',
    \ 'coc-yaml',
    \ 'coc-sql',
    \ 'coc-rust-analyzer',
    \ 'coc-pyright',
    \ 'coc-pydocstring',
    \ 'coc-markdownlint',
    \ 'coc-go',
    \ 'coc-docker',
    \ 'coc-css',
    \ 'coc-yank',
    \ 'coc-go',
    \ ]

" coc-prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
nmap <leader>f :CocCommand prettier.formatFile<cr>
command! -nargs=0 AsyncFormat :call CocActionAsync('format')
nmap <F2> :AsyncFormat<CR>
"au InsertLeave *.py execute("AsyncFormat")

" coc-git
nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)
nmap gs <Plug>(coc-git-chunkinfo)
nmap gu :CocCommand git.chunkUndo<cr>
xmap gu :CocCommand git.chunkUndo<cr>

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
let g:coc_snippet_next = '<tab>'

" use <c-space>for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
if exists('*complete_info')
  inoremap <silent><expr> <cr> complete_info(['selected'])['selected'] != -1 ? "\<C-y>" : "\<C-g>u\<CR>"
endif
nmap <silent> K :call <SID>show_documentation()<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <leader>rn <Plug>(coc-rename)
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
"xmap if <Plug>(coc-funcobj-i)
"omap if <Plug>(coc-funcobj-i)
"xmap af <Plug>(coc-funcobj-a)
"omap af <Plug>(coc-funcobj-a)
"xmap ic <Plug>(coc-classobj-i)
"omap ic <Plug>(coc-classobj-i)
"xmap ac <Plug>(coc-classobj-a)
"omap ac <Plug>(coc-classobj-a)

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" coc-yank
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-line)

" tabular
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

"copy by C-c
xmap <C-c> "+y

"word counter
function! WordCount()
    let currentmode = mode()
    if !exists("g:lastmode_wc")
        let g:lastmode_wc = currentmode
    endif
    " if we modify file, open a new buffer, be in visual ever, or switch modes
    " since last run, we recompute.
    if &modified || !exists("b:wordcount") || currentmode =~? '\c.*v' || currentmode != g:lastmode_wc
        let g:lastmode_wc = currentmode
        let l:old_position = getpos('.')
        let l:old_status = v:statusmsg
        execute "silent normal g\<c-g>"
        if v:statusmsg == "--No lines in buffer--"
            let b:wordcount = 0
        else
            let s:split_wc = split(v:statusmsg)
            if index(s:split_wc, "Selected") < 0
                let b:wordcount = str2nr(s:split_wc[11])
            else
                let b:wordcount = str2nr(s:split_wc[5])
            endif
            let v:statusmsg = l:old_status
        endif
        call setpos('.', l:old_position)
        return b:wordcount
    else
        return b:wordcount
    endif
endfunction

"filetype on
"filetype plugin on
"filetype indent on

"yaml tabstop 4
autocmd FileType yaml setlocal ts=4 sts=4 sw=4
"js tabstop 2
autocmd FileType javascript,vue setlocal ts=2 sts=2 sw=2
"golang
autocmd FileType go setlocal noexpandtab

"Terminal
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-l> <C-\><C-N><C-w>l
nmap <silent> <space>t  :CocCommand terminal.Toggle<cr>

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_enabled = 1
let g:indentLine_setConceal = 0
let g:indentLine_fileTypeExclude = ['dashboard', 'alpha']

" Markdown
autocmd FileType markdown let b:surround_{char2nr('i')} = "*\r*"
autocmd FileType markdown let b:surround_{char2nr('b')} = "**\r**"
autocmd FileType markdown nmap <buffer><silent> <space>i :call mdip#MarkdownClipboardImage()<CR>


" switch background of the solarized colorscheme
map <space>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>

" Lightline change colorscheme on the fly with vim's colorscheme
let s:colour_scheme_map = {'gruvbox8_hard': 'gruvbox8'}
augroup LightLineColorscheme
  autocmd!
  autocmd ColorScheme * call s:onColorSchemeChange(expand("<amatch>"))
augroup END
function! s:onColorSchemeChange(scheme)
    " Try a scheme provided already
    execute 'runtime autoload/lightline/colorscheme/'.a:scheme.'.vim'
    if exists('g:lightline#colorscheme#{a:scheme}#palette')
        let g:lightline.colorscheme = a:scheme
    else  " Try falling back to a known colour scheme
        let l:colors_name = get(s:colour_scheme_map, a:scheme, '')
        if empty(l:colors_name)
            return
        else
            echo l:colors_name
            let g:lightline.colorscheme = l:colors_name
        endif
    endif
    call lightline#init()
    call lightline#colorscheme()
    call lightline#update()
endfunction

"inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", '\<C-y>')
"call ncm2#override_source('LanguageClient_python', {'enable': 0})

"augroup MyCocExplorer
  "autocmd!
  "autocmd VimEnter * sil! au! FileExplorer *
  "autocmd BufEnter * let d = expand('%') | if isdirectory(d) | bd | exe 'CocCommand explorer ' . d | endif
"augroup END

" limelight
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" startify
let g:startify_lists = [
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ ]
let g:startify_bookmarks = [
            \ '~/python_projects/my',
            \ '~/go/src',
            \ { 'i': '~/.dotfiles/init.vim' },
            \ { 'sw': '~/.dotfiles/sway/config' },
            \ { 'z': '~/.zshrc' },
            \ ]
let g:startify_session_autoload = 1
let g:startify_change_to_vcs_root = 1
let g:startify_session_persistence = 1
let g:startify_enable_special = 0
let g:startify_session_sort = 1

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" AutoPairs
au FileType rust let b:AutoPairs = AutoPairsDefine({"<'" : '>'})
au FileType htmldjango let b:AutoPairs = AutoPairsDefine({'{%' : '%}'})
au FileType html,htmldjango let b:AutoPairs = AutoPairsDefine({'>' : '<'}, [])

" AsyncTasks
let g:asynctasks_term_listed = 0
let g:asynctasks_term_hidden = 1
let g:asynctasks_term_pos = 'bottom'
let g:asynctasks_term_reuse = 0
"let g:asynctasks_term_focus = 0
let g:asynctasks_term_rows = 10
noremap <silent><F7> :AsyncTask file-run<cr>
noremap <silent><F8> :AsyncTask project-run<cr>

" remove opened and closed terminals out of barbar
" (vimspector windows, coc-terminal etc.)
au TermOpen * setlocal nobuflisted | setlocal winfixheight | setlocal nowinfixwidth
au FileType alpha set nobuflisted
au BufLeave * call CleanNoNameEmptyBuffers()
au WinNew * setlocal winfixwidth
"au FileType coc-explorer setlocal winfixwidth
"au FileType dbui setlocal winfixwidth
function! CleanNoNameEmptyBuffers()
    let buffers = filter(range(1, bufnr('$')), 'buflisted(v:val) && empty(bufname(v:val)) && bufwinnr(v:val) < 0 && (getbufline(v:val, 1, "$") == [""])')
    if !empty(buffers)
        exe 'bd '.join(buffers, ' ')
    endif
endfunction
" better escape
let g:better_escape_interval = 100
let g:better_escape_shortcut = ['jk', 'jj', 'kj', 'ло', 'ол', 'оо']

" DBUI
nmap <silent> <space>d  :DBUIToggle<cr>

" NvimTree
let g:nvim_tree_auto_ignore_ft = [ 'startify', 'dashboard', 'alpha' ] "empty by default, don't auto open tree on specific filetypes.
"let g:nvim_tree_quit_on_open = 1 "0 by default, closes the tree when you open a file
let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
"let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
let g:nvim_tree_disable_window_picker = 1 "0 by default, will disable the window picker.
let g:nvim_tree_icon_padding = ' ' "one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
let g:nvim_tree_window_picker_exclude = {
    \   'filetype': [
    \     'packer',
    \     'qf'
    \   ],
    \   'buftype': [
    \     'terminal'
    \   ]
    \ }
" Dictionary of buffer option names mapped to a list of option values that
" indicates to the window picker that the buffer's window should not be
" selectable.
let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 } " List of filenames that gets highlighted with NvimTreeSpecialFile
"If 0, do not show the icons for one of 'git' 'folder' and 'files'
"1 by default, notice that if 'files' is 1, it will only display
"if nvim-web-devicons is installed and on your runtimepath.
"if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
"but this will not work when you set indent_markers (because of UI conflict)

" default will show icon by default if no icon is provided
" default shows no icon by default
let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
    \   'arrow_open': "",
    \   'arrow_closed': "",
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   },
    \   'lsp': {
    \     'hint': "",
    \     'info': "",
    \     'warning': "",
    \     'error': "",
    \   }
    \ }

nnoremap <C-n> :NvimTreeToggle<CR>
"nnoremap <leader>r :NvimTreeRefresh<CR>
"nnoremap <leader>n :NvimTreeFindFile<CR>
" NvimTreeOpen and NvimTreeClose are also available if you need them

" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=blue

lua << EOF
require'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = true,
  ignore_ft_on_setup  = {},
  auto_close          = false,
  open_on_tab         = false,
  hijack_cursor       = true,
  update_cwd          = true,
  update_to_buf_dir   = {
    enable = false,
    auto_open = false,
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = true,
    update_cwd  = true,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {'.git', 'node_modules', '.cache', '__pycache__'}
  },
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = 'left',
    auto_resize = false,
    mappings = {
      custom_only = false,
      list = {}
    }
  }
}
EOF
"autocmd VimEnter * bwipeout

" dashboard
lua << EOF
    local alpha = require'alpha'
    local dashboard = require'alpha.themes.dashboard'
    dashboard.section.buttons.val = {
        dashboard.button( "e",      "  New file",              ":ene <BAR> startinsert <CR>"),
        dashboard.button("SPC s  ", "  Sessions",              ":Telescope session-lens search_session<CR>"),
        dashboard.button("SPC p  ", "  Projects",              ":Telescope project<CR>"),
        dashboard.button("SPC f f", "  Find file",             ":Telescope find_files<CR>"),
        dashboard.button("SPC f h", "  Recently opened files", ":Telescope oldfiles<CR>"),
        dashboard.button("SPC f a", "  Find word",             ":Telescope live_grep<CR>"),
        dashboard.button("SPC f b", "  Jump to bookmarks",     ":Telescope marks<CR>"),
        dashboard.button("leader t c", "  Change colorscheme",    ":Telescope colorscheme<CR>"),
        dashboard.button( "s",      "  Settings",              ":e $MYVIMRC<CR>"),
        dashboard.button( "u",      "  Update Plugins",        ":PlugUpdate<CR>"),
        dashboard.button( "q",      "  Quit NVIM",             ":qa<CR>"),
    }
    alpha.setup(dashboard.opts)
EOF
lua << EOF
require'alpha'.setup(require'alpha.themes.dashboard'.opts)
EOF
let g:dashboard_custom_section={
\ 'a': {
    \ 'description': ['  Settings                      SPC e v'],
    \ 'command': 'edit $MYVIMRC'},
\ 'c': {
    \ 'description': ['  Update Plugins                SPC u  '],
    \ 'command': 'edit $MYVIMRC'},
\ 'b': {
    \ 'description': ['  Exit                          SPC q  '],
    \ 'command': 'edit $MYVIMRC'},
\ }
nmap <Leader>ss :<C-u>SaveSession<CR>
nmap <Leader>sl :<C-u>LoadLastSession<CR>
nnoremap <silent> <Space>s  :Telescope session-lens search_session<CR>
nnoremap <silent> <Space>p  :Telescope project<CR>
nnoremap <silent> <Space>fh :Telescope oldfiles<CR>
nnoremap <silent> <Space>ff :Telescope find_files<CR>
nnoremap <silent> <Space>fa :Telescope live_grep<CR>
nnoremap <silent> <Space>fb :Telescope marks<CR>
nnoremap <silent> <Leader>tc :Telescope colorscheme<CR>

" session manager
lua << EOF
    require('auto-session').setup {
        auto_save_enabled = true,
        auto_restore_enabled = true
    }
EOF
