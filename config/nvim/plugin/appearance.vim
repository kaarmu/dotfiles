" APPEARANCE OF NEOVIM, kaarmu
" ==============================================================================

syntax on
set  termguicolors

" -* Cursor
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" -* Base16
let base16colorspace=256  " Access colors present in 256 colorspace

" -* OneDark
let g:onedark_termcolors=256
let g:onedark_terminal_italics=1

" -* Airline
" let g:airline_theme='onedark'
let g:airline_theme='snow_dark'

colorscheme snow

if strftime('%H') >= 7 && strftime('%H') < 19 && 0
    set background=light
else
    set background=dark
endif

" ==============================================================================
