" vim: foldenable foldmethod=marker
set nocompatible
language messages en_US.UTF-8 " always use English for interface messages
syntax on

" Plugins {{{
" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')
Plug 'ervandew/supertab'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'mboughaba/i3config.vim'
call plug#end()

" FZF
source /usr/share/doc/fzf/examples/fzf.vim
" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
nnoremap <c-p> :FZF<cr>
" }}}

" Color scheme {{{
" termguicolors doesn't seem to work correctly in OSX Terminal
if (has("termguicolors") && ! has("osx"))
  set termguicolors
   let g:onedark_terminal_italics=1
endif
let g:onedark_color_overrides = {"black": {"gui": "#212226", "cterm": "235", "cterm16": "0" }}
colorscheme onedark
"}}}

" Variables configuration {{{
set backspace=indent,eol,start " Allow backspacing over everything in insert mode
set encoding=utf-8             " Use Unicode UTF-8 encoding
set hidden                     " A buffer becomes hidden when it is abandoned
set history=5000               " Keep 5000 lines of command line history
set hlsearch                   " Highlight all search matches
set ignorecase                 " Search is always case insensitive
set incsearch                  " Enable incremental search
set iskeyword+=_               " Treat underscore as a keyword (useful for word-based movements)
set linebreak                  " Don't break words when displaying wrapped lines
set listchars=tab:▸\ ,eol:¬,trail:· " Strings to use in 'list' mode
set nobackup                   " Don't create a backup file
set noerrorbells               " Don't beep
set nojoinspaces               " Don't insert two spaces after a '.', '?' and '!' with a join command
set noswapfile                 " Don't create a swap file
set shortmess+=I               " Don't show the `intro' message
set showbreak=↪                " String to put at the start of lines that have been wrapped
set showcmd                    " Show (partial) command in the last line of the screen
set showmatch                  " When a bracket is inserted, briefly jump to the matching one
set spellsuggest=best,10       " Spelling shows at most 10 suggestions
set synmaxcol=500              " Maximum column in which to search for syntax items
set undolevels=1000            " Keep 1000 undos in memory
set wildignore=*.swp,*.bak,*.pyc,*.class " File extensions ignored by autocompletion
set wildmode=list:longest,list:full " Completion mode after pressing <Tab>
" }}}

" Status line formatting {{{
" It looks like this:
" +-----------------------------------------------------+
" | (1) .vimrc 1% (1,1)             {VIM} [utf-8, unix] |
" +-----------------------------------------------------+
set laststatus=2                     " Always display the status line
set statusline=                      " Reset settings
set statusline+=\(%n\)               " Buffer number
set statusline+=\ %t                 " File name (tail) of file in the buffer
set statusline+=%m%r%h%w             " Flags (modified, read-only, help, preview)
set statusline+=\ %p%%               " Percentage through file of displayed window
set statusline+=\ (%l,%v)            " (line, virtual column) pair
set statusline+=%=                   " Separation point between left and right aligned items
set statusline+=\ {%Y}               " Type of file in the buffer
set statusline+=\ [%{&fileencoding}, " File encoding (eg. utf-8)
set statusline+=\ %{&fileformat}]    " File format (eg. dos, unix)
" }}}

" Custom key mappings {{{
" Unmap K (keyword lookup)
nnoremap K <Nop>

" Clear search highlighting
nmap <silent> <C-L> :let @/=""<CR>

" Reselect visual block after (in|de)dent in visual mode
vnoremap < <gv
vnoremap > >gv

" Insert current date and time
imap <silent> <C-F5> [<C-R>=strftime("%Y-%m-%d %H:%M")<CR>]

" List buffers
nnoremap <c-b> :ls<cr>:b<space>

" Switch between next/previous buffer
map <C-TAB> :bnext<CR>
map <C-S-TAB> :bprev<CR>
"}}}

" Custom functions {{{
function! StripTrailingWhitespace()
    %s/\s\+$//e
    let @/=''
endfunction
nnoremap <leader>W :call StripTrailingWhitespace()<CR>
" }}}

" Language-specific settings {{{
" Markdown
autocmd BufNewFile,BufRead *.md set filetype=markdown

" Oracle PL/SQL
autocmd BufNewFile,BufRead *.sql,*.pks,*.pkb,*.vw,*.tab,*.prc,*.fnc,*.tpb,afiedt.buf
\ setlocal expandtab filetype=plsql number shiftwidth=3

" Crontab
" Fixes error `crontab: temp file must be edited in place`
autocmd filetype crontab setlocal nobackup nowritebackup

" Git
" Spell check commit message
autocmd FileType gitcommit setlocal spell spelllang=en
"}}}
