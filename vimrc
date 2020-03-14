"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                   "
"                               PLUGINS                             "
"                                                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'pangloss/vim-javascript'
Plug 'easymotion/vim-easymotion'
" Plug 'dense-analysis/ale'
Plug 'tpope/vim-repeat'
Plug 'mileszs/ack.vim'
" Plug 'dracula/vim', { 'as': 'dracula'  }
Plug 'morhetz/gruvbox'
Plug 'mhinz/vim-signify'
Plug 'terryma/vim-multiple-cursors'
Plug 'terryma/vim-smooth-scroll'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'liuchengxu/vista.vim'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'json'] }

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                   "
"                         GENERAL CONFIGS                           "
"                                                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable	    	     " enable syntax processing
set redrawtime=10000         " fix error https://github.com/vim/vim/issues/2790
set tabstop=4                " number of visual spaces per TAB
set softtabstop=4            " number of spaces in tab when editing
set expandtab                " tabs are spaces
set clipboard=unnamed        " Use the OS clipboard by default 
set number                   " show line numbers
set showcmd                  " show command in bottom bar
set cursorline               " highlight current line
set wildmenu                 " visual autocomplete for command menu
set lazyredraw               " redraw only when we need to.
set showmatch                " highlight matching [{()}]
set mat=2                    " how many tenths of a second to blink when matching brackets
set incsearch                " search as characters are entered
set hlsearch                 " highlight matches
set foldenable               " enable folding
set foldlevelstart=10        " open most folds by default
set foldnestmax=10           " 10 nested fold max
set foldmethod=indent        " fold based on indent level
set splitbelow               " split below
set splitright               " split right
set encoding=UTF-8
set number relativenumber    " turn hybrid line numbers on
set autoread                 " Set to auto read when a file is changed from the outside
au FocusGained,BufEnter * checktime
set noswapfile
set backspace=indent,eol,start    " Allow backspace in insert mode
set autoindent               " auto-indent new line
set shiftwidth=4             " number of auto-indent spaces
set smartindent              " enable smart-indent 
set smarttab                 " enable smart-tab
set smartcase                " enable smart-case search
set ignorecase               " always case-insensitive
set incsearch                " search for string incremantally
filetype indent on           " enable filetype plugins
filetype plugin on
set whichwrap+=<,>,h,l,[,]   " automatically wrap left and right
set so=7                     " set 7 lines to the cursor - when moving vertically using j/k
set history=500              " sets how many lines of history VIM has to remember
set ruler                    " always show current position
set magic                    " for regular expressions turn magic on

" use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

set background=dark " for the dark version
colorscheme gruvbox
" colorscheme dracula
set t_8b=^[[48;2;%lu;%lu;%lum
set t_8f=^[[38;2;%lu;%lu;%lum]]]]

" Save whenever switching windows or leaving vim. This is useful when running
" the tests inside vim without having to save all files first.
au FocusLost,WinLeave * :silent! wa
" Trigger autoread when changing buffers or coming back to vim.
au FocusGained,BufEnter * :silent! !
" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                   "
"                              MAPPINGS                             "
"                                                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader="," " leader is comma
" disable highlight 
map <silent> <leader><cr> :noh<cr>
" space open/closes folds
nnoremap <space> za
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" move to beginning/end of line
nnoremap B ^
nnoremap E $
" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>
" highlight last inserted text
nnoremap gV `[v`]
" jj is escape
inoremap jj <esc>
" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<cr>
nnoremap <leader>ez :vsp ~/.zshrc<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" save session
nnoremap <leader>s :mksession<cr>
" nerdtree
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<space> 
map <leader>nf :NERDTreeFind<cr>
" <leader>bl           : list buffers
" <leader> + h/l/bg    : go back/forward/last-used
" <leader>bc           : close current buffer
" <leader>bac          : close all buffers expect current buffer
nnoremap <leader>bl :ls<cr>
nnoremap <leader>h :bp<cr>
nnoremap <leader>l :bn<cr>
nnoremap <leader>bg :e#<cr>
" nnoremap <leader>bc :<c-u>bp<bar>bd#<cr>
" nnoremap <leader>bda :<c-u>up<bar>%bd<bar>e#<bar>bd#<cr>
map <leader>bc :Bclose<cr>
map <leader>bda :call CloseAllBuffersExceptCurrent()<cr>
" smart way to move between windows
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l 
" resize windows
nnoremap > <C-W>>
nnoremap <lt> <C-W><lt>
nnoremap - <C-W>-
nnoremap + <C-W>+
" rotate windows
nnoremap <S-j> <C-W>J
nnoremap <S-k> <C-W>K
nnoremap <S-h> <C-W>H
nnoremap <S-l> <C-W>L 
" tab mappings
nnoremap <leader>tn :tabnew<cr>
nnoremap <leader>to :tabonly<cr>
nnoremap <leader>tc :tabclose<cr>
nnoremap <leader>tl :tabnext<cr>
nnoremap <leader>th :tabprev<cr>
nnoremap <leader>tm :tabm<space>
" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
nnoremap <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
" switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>
" When you press gv you Ack after the selected text
vnoremap <silent> gv :call VisualSelection('gv', '')<cr>
" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<cr>
" open windows
nnoremap <leader>ws :sp<cr>
nnoremap <leader>wv :vsp<cr>
" fast saving of a buffer
nmap <leader>w :w!<cr>
" searches for the current selection
vnoremap <silent> * :<C-u>call VisualSelection('', '')<cr>/<C-r>=@/<cr><cr>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<cr>?<C-r>=@/<cr><cr>
" insert current date time
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>
" quickly open a buffer for scripbble
map <leader>q :e ~/buffer<cr>
" toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>
" copy/paste with macos system clipboard
nmap <leader>p :set paste<cr>:r !pbpaste<cr>:set nopaste<cr>
imap <leader>p <Esc>:set paste<cr>:r !pbpaste<cr>:set nopaste<cr>
nmap <leader>y :.w !pbcopy<cr><cr>
vnoremap <silent> <leader>y :<cr>:let @a=@" \| execute "normal! vgvy" \| let res=system("pbcopy", @") \| let @"=@a<cr>
" Move a line of text using <leader>+[up/down] on mac
nnoremap <leader><Down> :m .+1<cr>==
nnoremap <leader><Up> :m .-2<cr>==
inoremap <leader><Down> <Esc>:m .+1<cr>==gi
inoremap <leader><Up> <Esc>:m .-2<cr>==gi
vnoremap <leader><Down> :m '>+1<cr>gv=gv
vnoremap <leader><Up> :m '<-2<cr>gv=gv

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                   "
"                           PLUGIN CONFIGS                          "
"                                                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Nerdtree
" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" do not open NERDTree when opening a saved session
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && v:this_session == "" | NERDTree | endif
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden=1 " show hidden files and folders
let NERDTreeIgnore=['.git', 'node_modules', '.DS_Store'] " ignore files and folders
let g:NERDTreeMapJumpPrevSibling=""
let g:NERDTreeMapJumpNextSibling=""

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#ale#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'base16_gruvbox_dark_hard'

" Vim-tmux-navigator 
" Write all buffers before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch = 2

" Coc.nvim
autocmd FileType json syntax match Comment +\/\/.\+$+

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=100

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <Right> for select text for visual placeholder of snippet.
vmap <Right> <Plug>(coc-snippets-select)

" Use <Right> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<right>'

" Use <Left> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<left>'

" Use <Right> for both expand and jump (make expand higher priority.)
imap <Right> <Plug>(coc-snippets-expand-jump)

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<cr>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<cr>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<cr>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<cr>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<cr>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<cr>

" Vim-javascript
let g:javascript_plugin_jsdoc = 1
augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END

" Vim-easymotion
"
map z <Plug>(easymotion-prefix)
map s2 <Plug>(easymotion-s2)
map f2 <Plug>(easymotion-f2)
map F2 <Plug>(easymotion-F2)
map t2 <Plug>(easymotion-t2)
map T2 <Plug>(easymotion-T2)

" Ale
" let g:ale_fixers = {
" \   '*': ['remove_trailing_lines', 'trim_whitespace'],
" \   'javascript': ['eslint'],
"   \ 'json': ['prettier']
" \}
" let g:ale_sign_error = '✗✗'
" let g:ale_sign_warning = '∆∆'
" nmap <silent> <leader>[ <Plug>(ale_previous_wrap)
" nmap <silent> <leader>] <Plug>(ale_next_wrap)
" map <leader>= :ALEFix<cr>

" Ack
nnoremap <space>a :Ack!<space>

" Ripgrep
if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
    let g:ackprg = 'rg --vimgrep --no-heading'
endif

" Vim-smooth-scroll
noremap <silent> <C-u> :call smooth_scroll#up(&scroll, 0, 2)<cr>
noremap <silent> <C-d> :call smooth_scroll#down(&scroll, 0, 2)<cr>
noremap <silent> <C-b> :call smooth_scroll#up(&scroll*2, 0, 4)<cr>
noremap <silent> <C-f> :call smooth_scroll#down(&scroll*2, 0, 4)<cr>

" Vim-signify
nnoremap <leader>gd :SignifyDiff<cr>
nnoremap <leader>gp :SignifyHunkDiff<cr>
nnoremap <leader>gu :SignifyHunkUndo<cr>

" hunk jumping
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)

" hunk text object
omap ic <plug>(signify-motion-inner-pending)
xmap ic <plug>(signify-motion-inner-visual)
omap ac <plug>(signify-motion-outer-pending)
xmap ac <plug>(signify-motion-outer-visual)

" IndentLine
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" Vista.vim
let g:vista_default_executive = 'coc'
let g:vista_fzf_preview = ['right:50%']
nmap <leader>vv :Vista!!<cr>

" Fzf
nnoremap <silent> <c-p> :Files<cr>
nnoremap <silent> <c-g> :Rg<cr>
nnoremap <silent> <leader>bb :Buffers<cr>

let g:fzf_layout = { 'down': '~30%' }

autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -g "!{node_modules,.git}" '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" Vim-prettier
let g:prettier#exec_cmd_async = 1
let g:prettier#autoformat = 1
" running before saving async (vim 8+)
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                   "
"                           HELP FUNCTIONS                          "
"                                                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction 

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Don't close window when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
  let l:currentBufNum = bufnr("%")
  let l:alternateBufNum = bufnr("#")

  if buflisted(l:alternateBufNum)
    buffer #
  else
    bnext
  endif

  if bufnr("%") == l:currentBufNum
    new
  endif

  if buflisted(l:currentBufNum)
    execute("bdelete! ".l:currentBufNum)
  endif
endfunction

function! CloseAllBuffersExceptCurrent()
  let currentBuffer = bufnr("%")
  let lastBuffer = bufnr("$")
  let nerdtreeBuffer = bufnr(t:NERDTreeBufName)

  if currentBuffer < nerdtreeBuffer
    let midBufferBefore = currentBuffer | let midBufferAfter = nerdtreeBuffer
  else
    let midBufferBefore = nerdtreeBuffer | let midBufferAfter = currentBuffer
  end

  if midBufferBefore > 1 | silent! execute "1,".(midBufferBefore-1)."bd" | endif
  if (midBufferAfter - midBufferBefore) > 2 | silent! execute (midBufferBefore+1).",".(midBufferAfter-1)."bd" | endif
  if midBufferAfter < lastBuffer | silent! execute (midBufferAfter+1).",".lastBuffer."bd" | endif
endfunction

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif
