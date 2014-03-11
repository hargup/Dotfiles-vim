" ========== Vim Basic Settings ============="
" Make vim incompatbile to vi.

set nocompatible
set modelines=0

set autoread

 set rtp+=~/.vim/vundle.git/
"call vundle#rc()
" Pathogen settings.
filetype on
call pathogen#runtime_append_all_bundles()
call pathogen#infect()
Helptags
filetype plugin indent on
filetype plugin on

"TAB settings.
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" More Common Settings.
set encoding=utf-8
set scrolloff=3
set autoindent
set smarttab
set showmode
set showcmd
"set hlsearch                      " Highlight matches.
set nobackup        " Don't make a backup before overwriting a file.
set incsearch                     " Highlight matches as you type.
set wildmode=list:longest
set visualbell          "No Beeping
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location
set cursorline
set cursorcolumn " For the cross hair"
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

" Show trailing whitespace only after some text (ignore empty lines)"
highlight ExtraWhitespace ctermbg=red guibg=red
Filetype py match ExtraWhitespace /\s\+$/

set number
set norelativenumber

"set undofile
"set shell=/bin/zsh
set lazyredraw
set matchtime=3

" Additions from  OSCON 2013: \"More Instantly Better Vim\" - Damian Conway

"====[ Mappings to activate spell-checking alternatives ]================

    nmap  ;s     :set invspell spelllang=en<CR>
    nmap  ;ss    :set    spell spelllang=en-basic<CR>

"Changing Leader Key
let mapleader = ";"

" Set title to window
set title
" Dictionary path, from which the words are being looked up.
set dictionary=/usr/share/dict/words

" Make Vim able to edit corntab fiels again.
set backupskip=/tmp/*,/private/tmp/*"

" Enable Mouse
set mouse=a

syntax on

"Settings for Searching and Moving

set ignorecase                   "Case-insensitive searching
set smartcase                    " But case-sensitive if expression contains a capital letter.
set gdefault
set showmatch

" Make Vim to handle long lines nicely.
set wrap
set textwidth=79
set formatoptions=qrn1
"set colorcolumn=79

" To  show special characters in Vim
"set list
set listchars=tab:▸\ ,eol:¬

" autogeneration of ctags
au BufWritePost *.c,*.cpp,*.h,*py silent! !ctags -R --fields=+l &

" Make vim work nice with wrapped text "
nnoremap j gj
nnoremap k gk
nnoremap $ g$
nnoremap ^ g^

" Move around splits with <C-[hjkl]> "
" credit: https://github.com/mrnugget/vimconfig/blob/master/vimrc
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

"Little tinkering with braces
autocmd Filetype cpp inoremap { {<RETURN>}<ESC>O
autocmd Filetype c inoremap { {<RETURN>}<ESC>O

" Set vim to save the file on focus out.
au FocusLost * :wa

" Adding More Shorcuts keys using leader kye.
" Leader Kye provide separate namespace for specific commands.
",W Command to remove white space from a file.
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" ;ft Fold tag, helpful for HTML editing.
nnoremap <leader>ft vatzf

" ;q Re-hardwrap Paragraph
nnoremap <leader>q gqip

" ;v Select just pasted text.
nnoremap <leader>v V`]

" ;ev Shortcut to edit .vimrc file on the fly on a vertical window.
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" system settings
set lazyredraw          " no redraws in macros
set confirm             " get a dialog when :q, :w, or :wq fails
set nobackup            " no backup~ files.
set viminfo='20,\"500   " remember copy registers after quitting in the .viminfo file -- 20 jump links, regs up to 500 lines'
set hidden              " remember undo after quitting
set history=50          " keep 50 lines of command history
set clipboard=unnamedplus   " Sets the unnamed registers to allow easy copypaste


" Working with split screen nicely
" Resize Split When the window is resized"
au VimResized * :wincmd =

" Code folding settings go here:
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

set completeopt =longest,menuone

" Wildmenu completion "
set wildmenu
set wildmode=list:longest
set wildignore+=.hg,.git,.svn " Version Controls"
set wildignore+=*.aux,*.out,*.toc "Latex Indermediate files"
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg "Binary Imgs"
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest "Compiled Object files"
set wildignore+=*.spl "Compiled speolling world list"
set wildignore+=*.sw? "Vim swap files"
set wildignore+=*.DS_Store "OSX SHIT"
set wildignore+=*.luac "Lua byte code"
set wildignore+=migrations "Django migrations"
set wildignore+=*.pyc "Python Object codes"
set wildignore+=*.orig "Merge resolution files"

" Make Sure that Vim returns to the same line when we reopen a file"
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \ execute 'normal! g`"zvzz' |
        \ endif
augroup END


" =========== END Basic Vim Settings ===========


" =========== Gvim Settings =============

" Removing scrollbars
"if has("gui_running")

" Change the font to Hermit
if has('gui_running')
    set guifont=hermit
endif

"Entering Blank lines
nmap <S-Enter> O<Esc>j
nmap <C-Enter> o<Esc>k

set t_Co=256
colorscheme molokai
"endif
let g:airline_powerline_fonts=1
set ttimeoutlen=50
" Special Settings for Consoles
"if !has("gui_running")
"    set t_Co=256
"    colorschem mustang
"endif
autocmd Filetype cpp nmap <buffer> <F5> :SCCompileRun -DLOCAL -O3 -Wall -Wextra -pedantic<CR>
autocmd Filetype cpp nmap <buffer> <F4> :SCCompileAF -DLOCAL -O3 -Wall <CR>
" Source the vimrc file after saving it
"autocmd bufwritepost .vimrc source ~/.vimrc

" ========== END Gvim Settings ==========

" ========== YouCompleteMe Settings -----"
 
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
" ========== Plugin Settings =========="

let g:dwm_map_keys = 1
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" -------------------------------------------
" Settings for Ultisnips

"function! g:UltiSnips_Complete()
"    call UltiSnips_ExpandSnippet()
"    if g:ulti_expand_res == 0
"        if pumvisible()
"            return "\<C-n>"
"        else
"            call UltiSnips_JumpForwards()
"            if g:ulti_jump_forwards_res == 0
"               return "\<TAB>"
"            endif
"        endif
"    endif
"    return ""
"endfunction
"
"au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
"
"let g:UltiSnipsExpandTrigger="<TAB>"
"let g:UltiSnipsJumpForwardTrigger="<TAB>"
"let g:UltiSnipsJumpBackwardTrigger="<leader>b"
"
"" ------------------------------------------
"

let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

" Mapping to NERDTree
nnoremap <F9> :NERDTreeToggle<cr>
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$']

let g:Tlist_Use_Right_Window = 1
let Tlist_Use_SingleClick = 1
let g:dwm_map_keys = 0

" Mini Buffer some settigns."
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1

" Taglist toogle Key binding
nmap <F8> :TlistToggle<CR>
nmap <F4> :SCCompile<cr>
nmap <F5> :SCCompileRun<cr>
nmap <F6> :SCViewResult<cr>

" =========== END Plugin Settings =========="
"
