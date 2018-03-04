" General

" Theme {{{
  set background=dark

  " Enable syntax highlighting
  if !exists("g:syntax_on")
    syntax enable
  endif

  try
    colorscheme base16-ocean
  endtry
" }}}

" Sets how many lines of history VIM has to remember
set history=500

set textwidth=80

" A buffer becomes hidden when it is abandoned
set hid
