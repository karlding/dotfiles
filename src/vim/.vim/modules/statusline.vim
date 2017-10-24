" Status line {{{
  set laststatus=2                        " Always show the status line

  " Format the status line
  set statusline=\ %{HasPaste()}
  set statusline+=%F                      " Full path to the file in the buffer
  set statusline+=%m                      " Modified flag
  set statusline+=%r                      " Read-only flag
  set statusline+=%h                      " Help buffer flag
  set statusline+=\ %w

  set statusline+=\ \ cwd:\ %{getcwd()}   " Current working directory

  set statusline+=\ \ \ Line:\ %l         " Line number
  set statusline+=\/%L                    " Number of lines in buffer

  set statusline+=\ \ Column:\ %c         " Column number
" }}}
