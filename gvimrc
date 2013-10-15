execute pathogen#infect()      
execute pathogen#helptags()

" clear all autocommands
autocmd!

set nocompatible           " break away from old vi compatibility
set viminfo=               " don't use viminfo files


"------------ Console UI and Text Display
" turn off visual bell
set vb t_vb =               " don't make faces
set ruler                   " show current position at bottom
set noerrorbells            " don't whine
set scrolloff=5             " keep at least 5 lines around cursor
set nu                      " turn on line numbers
set smartindent autoindent  " 
set showmatch               " show matching brace/parenthesis/bracket

set noet ci pi sts=0 sw=4 ts=4   " smart tab/space handling

" colourscheme settings
if has("gui_running")
    set lines=35 columns=140
    " colorscheme marklar " ir_black
    colorscheme breeze
    " set background=dark
else
    set t_Co=256
    colorscheme navajo     "darkblue
    "set background=dark
endif

" bash-like auto-completion
set wildmenu
set wildmode=list:longest

" set syntax and filetype
syntax on
filetype on
set fileformats=unix,dos,mac    " support all newline formats
filetype plugin indent on

" set search format
set incsearch
set ignorecase
set smartcase

" statusline
" set statusline=%2*%n\|%<%*%-.40F%2*\|\ %2*%M\ %3*%=%1*\ %1*%2.6l%2*x%1*%1.9(%c%V%)%2*[%1*%P%2*]%1*%2B
" set statusline=%t%h%m%r%=[%b\ 0x%02B]\ \ \ %l,%c%V\ %P
set statusline=%-5.3n\ %F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]%=\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

" Always show a status line
set laststatus=2
"make the command line 1 line high
set cmdheight=1


nmap <F8> :TagbarToggle<CR>

" some doxygen specifics
let g:DoxygenToolkit_commentType = "C++"
nmap <F9> :Dox<CR>
nmap <F10> :DoxLic<CR>

" Nerd tree
map <C-n> :NERDTreeToggle<CR>

" Set color scheme according to current time of day.
"   :SetColors
command! -nargs=* SetColors call s:HourColor()
function! s:HourColor()
  let hr = str2nr(strftime('%H'))
  if hr <= 3
    let i = 0
  elseif hr <= 7
    let i = 1
  elseif hr <= 14
    let i = 2
  elseif hr <= 18
    let i = 3
  else
    let i = 4
  endif
 " let nowcolors = 'elflord morning desert evening pablo'
  let nowcolors = 'marklar breeze darkblue navajo pablo'
  execute 'colorscheme '.split(nowcolors)[i]
  redraw
  echo g:colors_name
endfunction

