" Fisa-nvim-config
" http://nvim.fisadev.com
" version: 11.1

" TODO current problems:
" * end key not working undef tmux+fish

" ============================================================================
" Vim-plug initialization
" Avoid modifying this section, unless you are very sure of what you are doing

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
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'Shougo/deoplete-lsp'
Plug 'honza/vim-snippets'
"Plug 'fatih/vim-go', {'for': 'go'}

" Override configs by directory
"Plug 'arielrossanigo/dir-configs-override.vim'

" Code commenter
Plug 'scrooloose/nerdcommenter'

" Better file browser
"Plug 'scrooloose/nerdtree'
"Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'ryanoasis/vim-devicons'
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Class/module browser
Plug 'preservim/tagbar'

" Search results counter
"Plug 'vim-scripts/IndexedSearch'

" Terminal Vim with 256 colors colorscheme
"Plug 'fisadev/fisa-vim-colorscheme'

" Airline
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/lightline.vim'

" Code and files fuzzy finder
" Plug 'ctrlpvim/ctrlp.vim'
" Extension to ctrlp, for fuzzy command finder
" Plug 'fisadev/vim-ctrlp-cmdpalette'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Pending tasks list
"Plug 'fisadev/FixedTaskList.vim'

" Async autocompletion
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Completion from other opened files
"Plug 'Shougo/context_filetype.vim'
" Python autocompletion
"Plug 'zchee/deoplete-jedi', { 'do': ':UpdateRemotePlugins' }
" Just to add the python go-to-definition and similar features, autocompletion
" from this plugin is disabled
"Plug 'davidhalter/jedi-vim'

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
Plug 'nvim-treesitter/nvim-treesitter'
"Plug 'romgrk/nvim-treesitter-context'
" Ack code search (requires ack installed in the system)
"Plug 'mileszs/ack.vim'

" Paint css colors with the real color
Plug 'norcalli/nvim-colorizer.lua'

" Window chooser
"Plug 't9md/vim-choosewin'

" Highlight matching html tags
"Plug 'valloric/MatchTagAlways'

" Generate html in a simple way
Plug 'mattn/emmet-vim', { 'for': 'html' }

" Git integration
Plug 'tpope/vim-fugitive'

" Git/mercurial/others diff icons on the side of the file lines
"Plug 'mhinz/vim-signify'

" Yank history navigation
"Plug 'vim-scripts/YankRing.vim'

" Linters
"Plug 'neomake/neomake'
"Plug 'Chiel92/vim-autoformat'
" TODO is it running on save? or when?
" TODO not detecting errors, just style, is it using pylint?

" Relative numbering of lines (0 is the current line)
" (disabled by default because is very intrusive and can't be easily toggled
" on/off. When the plugin is present, will always activate the relative
" numbering every time you go to normal mode. Author refuses to add a setting
" to avoid that)
"Plug 'myusuf3/numbers.vim'

" Nice icons
" Plug 'ryanoasis/vim-devicons'

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

" Python folding
Plug 'Konfekt/FastFold'

Plug 'puremourning/vimspector' | let g:vimspector_enable_mappings = 'VISUAL_STUDIO'

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

Plug 'wsdjeg/vim-todo'

Plug 'mhinz/vim-startify'

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
call plug#end()
" end plugins }}}


lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "python",
  highlight = {
   enable = true,
    use_languagetree = true,
  },
  indent = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
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

" height of the complete window
set pumheight=15
" Ability to add python breakpoints
" (I use ipdb, but you can change it to whatever tool you use for debugging)
au FileType python map <silent> <leader>b O__import__("ipdb").set_trace()<esc>

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
    \             [ 'git', 'diagnostic', 'cocstatus', 'readonly', 'filename', 'modified' ] ],
    \   'right': [ [ 'lineinfo' ], [ 'percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
    \ },
    \
    \ 'component_function': {
    \   'cocstatus': 'coc#status'
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

" Autoclose ------------------------------

" Fix to let ESC work as espected with Autoclose plugin
" (without this, when showing an autocompletion window, ESC won't leave insert
"  mode)
"let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}

" Yankring -------------------------------

" Fix for yankring and neovim problem when system has non-text things copied
" in clipboard
"let g:yankring_clipboard_monitor = 0
"let g:yankring_history_dir = '~/.config/nvim/'

"-------------------------------------------
" Golang Settings
"-------------------------------------------
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
"let g:go_def_mapping_enabled = 0

"let g:go_list_type = "quickfix"
"let g:go_list_autoclose = 1

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
    \ 'coc-css'
    \ ]

" coc-prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
nmap <leader>f :CocCommand prettier.formatFile<cr>
nmap <F2> :call CocActionAsync('format')<CR>

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
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
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
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

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

"yaml tabstop 4
autocmd FileType yaml setlocal ts=4 sts=4 sw=4
"js tabstop 2
autocmd FileType javascript setlocal ts=2 sts=2 sw=2

"Terminal
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert

" Avoid showing message extra message when using completion
set shortmess+=c

let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_enabled = 1
let g:indentLine_setConceal = 0

" Markdown
autocmd FileType markdown let b:surround_{char2nr('i')} = "*\r*"
autocmd FileType markdown let b:surround_{char2nr('b')} = "**\r**"


" switch background of the solarized colorscheme
map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>

" Lightline change colorscheme on the fly with vim's colorscheme
autocmd OptionSet background
      \ execute 'source' globpath(&rtp, 'autoload/lightline/colorscheme/gruvbox.vim')
      \ | call lightline#colorscheme() | call lightline#update()

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
            \ { 'i': '~/.dotfiles/init.vim' },
            \ { 'sw': '~/.dotfiles/sway/config' },
            \ { 'z': '~/.zshrc' },
            \ '~/python_projects/my',
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

" AsyncTasks
let g:asynctasks_term_listed = 0
let g:asynctasks_term_hidden = 1
let g:asynctasks_term_pos = 'bottom'
"let g:asynctasks_term_focus = 0
let g:asynctasks_term_rows = 10
noremap <silent><F7> :AsyncTask file-run<cr>
noremap <silent><F8> :AsyncTask project-run<cr>

" remove opened and closed terminals out of barbar
" (vimspector windows, coc-terminal etc.)
autocmd TermOpen * setlocal nobuflisted
