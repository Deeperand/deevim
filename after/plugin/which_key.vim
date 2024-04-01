if exists('g:loaded_vim_which_key')
  if g:loaded_vim_which_key == 1

  " regist dictionary to key
    call which_key#register('#KeyHint#', "g:which_key_map")
    call which_key#register('\', "g:which_key_map_Leader")
    call which_key#register('[', "g:which_key_map_LeftSqureBracket")
    call which_key#register(']', "g:which_key_map_RightSqureBracket")
    call which_key#register('<', "g:which_key_map_LeftAngle")
    call which_key#register('>', "g:which_key_map_RightAngle")
    call which_key#register('=', "g:which_key_map_Equal")
    call which_key#register(' ', "g:which_key_map_Local_Leader")
    call which_key#register('a', "g:which_key_map_a")
    call which_key#register('g', "g:which_key_map_g")
    call which_key#register('i', "g:which_key_map_i")
    call which_key#register('z', "g:which_key_map_z")
    call which_key#register('S', "g:which_key_map_Surround")
    call which_key#register('T', "g:vim_default_textobj")
  endif
endif
