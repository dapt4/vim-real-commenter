function! SetComment(isVisual)
  let line = getline(line('.'))
  let commentSyntax = GetCommentSyntax(&filetype)
  if len(commentSyntax) == 0
    :echo "unsupported file type"
    return
  endif
  if a:isVisual == 0
    let isComment = VimIncludesLine(line, commentSyntax) 
    if isComment[0] == 0
      if len(commentSyntax) == 1 || len(commentSyntax) == 3
        :call CharacterAggregator(commentSyntax[0], '', a:isVisual)
      elseif len(commentSyntax) == 2
        :call CharacterAggregator(commentSyntax[0], commentSyntax[1], a:isVisual)
      endif
    elseif isComment[0] == 1
      if len(commentSyntax) == 1 || len(commentSyntax) == 3 && isComment[1] == commentSyntax[0]
        :call CharacterRemove(commentSyntax[0], '', a:isVisual)
      elseif len(commentSyntax) == 3 && isComment[1] == commentSyntax[1]
        :call CharacterRemove(commentSyntax[1], commentSyntax[2], a:isVisual)
      elseif len(commentSyntax) == 2
        :call CharacterRemove(commentSyntax[0], commentSyntax[1], a:isVisual)
      endif
    endif
  elseif a:isVisual == 1
    let isComment = VimIncludesLine(line, commentSyntax) 
    if isComment[0] == 0
      if len(commentSyntax) == 1 || len(commentSyntax) == 3
        :call CharacterAggregator(commentSyntax[1], commentSyntax[2], a:isVisual)
      elseif len(commentSyntax) == 2
        :call CharacterAggregator(commentSyntax[0], commentSyntax[1], a:isVisual)
      endif
    elseif isComment[0] == 1
      if len(commentSyntax) == 1 
        :call CharacterRemove(commentSyntax[0], '', a:isVisual)
      elseif len(commentSyntax) == 3 && isComment[1] == commentSyntax[1]
        :call CharacterRemove(commentSyntax[1], commentSyntax[2], a:isVisual)
      elseif len(commentSyntax) == 2
        :call CharacterRemove(commentSyntax[0], commentSyntax[1], a:isVisual)
      endif
    endif
  endif
endfunction


function! GetCommentSyntax(filetype)
  if a:filetype ==# 'autocmd'
    return ['"']
  elseif a:filetype ==# 'bsh'
    return ['//']
  elseif a:filetype ==# 'c' || a:filetype ==# 'java'
    return ['//', '/\\*', '*/'] " '/\\*' for escape '/*'
  elseif a:filetype ==# 'jsp'
    return ['<%--','--%>']
  elseif a:filetype ==# 'cmake'  
    return ['#']
  elseif a:filetype ==# 'clojure'
    return [';;']
  elseif a:filetype ==# 'coffeescript'
    return ['#', '###', '###']
  elseif a:filetype ==# 'conf'
    return ['#']
  elseif a:filetype ==# 'cpp'
    return ['//', '/\\*', '*/']
  elseif a:filetype ==# 'css'
    return ['/\\*', '*/']
  elseif a:filetype ==# 'csv'
    return ['#']
  elseif a:filetype ==# 'd'
    return ['//']
  elseif a:filetype ==# 'dart'
    return ['//', '/\\*', '*/']
  elseif a:filetype ==# 'diff'
    return ['//']
  elseif a:filetype ==# 'dot'
    return ['//']
  elseif a:filetype ==# 'eruby'
    return ['#']
  elseif a:filetype ==# 'erlang'
    return ['%']
  elseif a:filetype ==# 'exif'
    return ['//']
  elseif a:filetype ==# 'fish'
    return ['#']
  elseif a:filetype ==# 'fortran'
    return ['!']
  elseif a:filetype ==# 'gdscript'
    return ['#']
  elseif a:filetype ==# 'gitcommit'
    return ['#']
  elseif a:filetype ==# 'gitconfig'
    return ['#']
  elseif a:filetype ==# 'gitrebase'
    return ['#']
  elseif a:filetype ==# 'go'
    return ['//', '/\\*', '*/']
  elseif a:filetype ==# 'graphql'
    return ['#', "'''", "'''"]
  elseif a:filetype ==# 'haml'
    return ['-#']
  elseif a:filetype ==# 'handlebars'
    return ['{{!', '}}']
  elseif a:filetype ==# 'html'
    return ["<!--", "-->"]
  elseif a:filetype ==# 'htmldjango'
    return ['{#', '#}']
  elseif a:filetype ==# 'html+django'
    return ['{#', '#}']
  elseif a:filetype ==# 'http'
    return ['#']
  elseif a:filetype ==# 'ini'
    return [';']
  elseif a:filetype ==# 'jade'
    return ['//', "<!--", "-->"]
  elseif a:filetype ==# 'javascript' 
    return ['//', '/\\*', '*/'] 
  elseif a:filetype ==# 'javascript.jsx' || a:filetype ==# 'typescript.tsx'
    return ['//', '/\\*', '*/']
  elseif a:filetype ==# 'kotlin'
    return ['//', '/\\*', '*/']
  elseif a:filetype ==# 'latex'
    return ['%']
  elseif a:filetype ==# 'less'
    return ['//', '/\\*', '*/']
  elseif a:filetype ==# 'lisp'
    return [';;']
  elseif a:filetype ==# 'livescript'
    return ['#', '/\\*', '*/']
  elseif a:filetype ==# 'lua'
    return ['--', '--[[', '--]]']
  elseif a:filetype ==# 'makefile'
    return ['#']
  elseif a:filetype ==# 'markdown'
    return ["<!--", "-->"]
  elseif a:filetype ==# 'matlab'
    return ['%', '%{', '%}']
  elseif a:filetype ==# 'objc'
    return ['//', '/\\*', '*/']
  elseif a:filetype ==# 'octave'
    return ['#']
  elseif a:filetype ==# 'perl'
    return ['#', '=begin', '=cut']
  elseif a:filetype ==# 'php'
    return ['//', '/\\*', '*/']
  elseif a:filetype ==# 'piglet'
    return ['#']
  elseif a:filetype ==# 'python'
    return ['#', "'''", "'''"]
  elseif a:filetype ==# 'qml'
    return ['//']
  elseif a:filetype ==# 'r'
    return ['#']
  elseif a:filetype ==# '"rst"'
    return ['..']
  elseif a:filetype ==# 'ruby'
    return ['#', '=begin', '=end']
  elseif a:filetype ==# 'rust'
    return ['//', '/\\*', '*/']
  elseif a:filetype ==# 'sass'
    return ['//', '/\\*', '']
  elseif a:filetype ==# 'scala'
    return ['//', '/\\*', '*/']
  elseif a:filetype ==# 'scheme'
    return [';;']
  elseif a:filetype ==# 'scss'
    return ['//', '/\\*', '*/']
  elseif a:filetype ==# 'shell'
    return ['#']
  elseif a:filetype ==# 'sql'
    return ['--', '/\\*', '*/']
  elseif a:filetype ==# 'stylus'
    return ['//', '/\\*', '*/']
  elseif a:filetype ==# 'swift'
    return ['//', '/\\*', '*/']
  elseif a:filetype ==# 'tcl'
    return ['#']
  elseif a:filetype ==# 'tex'
    return ['%']
  elseif a:filetype ==# 'toml'
    return ['#']
  elseif a:filetype ==# 'typescript'
    return ['//', '/\\*', '*/']
  elseif a:filetype ==# 'vala'
    return ['//', '/\\*', '*/']
  elseif a:filetype ==# 'vb'
    return ["'"]
  elseif a:filetype ==# 'vim'
    return ['"']
  elseif a:filetype ==# 'xml'
    return ["<!--", "-->"]
  elseif a:filetype ==# 'yaml'
    return ['#']
  else
    return []
  endif
endfunction


function! CharacterRemove(start_char, end_char, isVisual)
  let start_char2 = a:start_char == '/\\*' ? '/*' : a:start_char
  if !a:isVisual 
    let line = getline(line('.'))
    let start_col = match(line, start_char2)
    let cursor_col = col('.')
    let end_col = a:end_char != '' ? match(line, a:end_char) : strlen(line)
    let len_s_char = len(start_char2)
    let len_e_char = len(a:end_char)
    let first_slice = cursor_col == 1 ? '' : line[0: start_col - 1]
    let second_slice = line[start_col + len_s_char : end_col -1]
    let third_slice = line[end_col + len_s_char :]
    let concatenated_text = first_slice . second_slice . third_slice
    :call setline(line('.'), concatenated_text)
  elseif a:isVisual
    let [start_line, start_col] = getpos("'<")[1:2]
    let [end_line, end_col] = getpos("'>")[1:2]
    if start_line == end_line
      let line = getline(line('.'))
      let line_slice1 = start_col == 1 ? '' : line[:start_col - len(start_char2)]
      let line_slice2 = line[start_col +1 : end_col - len(a:end_char) -1]
      let line_slice3 = line[ end_col : ]
      let line_finished = line_slice1 . line_slice2 . line_slice3 
      :call setline(start_line, line_finished)
      return
    endif
    let first_line = getline(start_line)
    let final_line = getline(end_line)
    let first_line_slice1 = start_col == 1 ? '' : first_line[ 0 : start_col - len(start_char2)]
    let first_line_slice2 = first_line[start_col + len(start_char2) -1: ]
    let first_line_finished = first_line_slice1 . first_line_slice2
    :call setline(start_line, first_line_finished)
    let final_line_slice1 = final_line[ 0 : end_col - len(a:end_char) -1]
    let final_line_slice2 = final_line[end_col : ] 
    let final_line_finished = final_line_slice1 . final_line_slice2
    :call setline(end_line, final_line_finished)
  endif
endfunction

function! CharacterAggregator(start_char, end_char, isVisual)  
  let start_char2 = a:start_char == '/\\*' ? '/*' : a:start_char
  if !a:isVisual 
    let line = getline(line('.'))
    normal! 0
    if line[0:0] == ' ' 
      normal! w
    endif
    let cursor_pos = getpos('.')
    let prev = cursor_pos[2] == 1 ? '' : line[0 : cursor_pos[2] - 2]
    let post = line[cursor_pos[2] - 1:]
    let text_commented = prev . start_char2 . post . a:end_char
    call setline(line('.'), text_commented)
    return
  endif
  " Get the the start and end position of the selection
  let [start_line, start_col] = getpos("'<")[1:2]
  let [end_line, end_col] = getpos("'>")[1:2]
  let final_line = getline(end_line)
  let first_line = getline(start_line)
  if len(first_line) == 0
    let start_line += 1
    let start_col = 1
  endif
  if len(final_line) == 0
    let end_line -= 1
    let final_line = getline(end_line)
    let end_col = len(final_line)
  endif
  if end_col == len(final_line) + 1 
    call cursor(end_line, end_col - 1)
    let end_col -= 1
  endif
  " Get the selected text
  let lines = []
  let selected_text = ''
  if start_line == end_line 
    let selected_text = getline(start_line, end_line)
  else
    for line_number in range(start_line, end_line)
      let line_content = getline(line_number)
      call add(lines, [line_number, line_content])
    endfor
  endif
  if len(lines) > 0
    for i in range(0, len(lines) - 1)
      if i == 0
        let previous = start_col == 1 ? '' : lines[0][1][0 : start_col - 2]
        let lines[0][1] = previous . start_char2 . lines[0][1][start_col - 1:]
      elseif i == len(lines) - 1
        let lines[i][1] = lines[i][1][: end_col - (&selection == 'inclusive' ? 1 : 2)] . a:end_char . lines[i][1][end_col:]
      endif
      call setline(lines[i][0], lines[i][1])
    endfor
  endif
  if type(selected_text) == 3
    let selected_text[-1] = selected_text[-1][: end_col - (&selection == 'inclusive' ? 1 : 2)]
    let selected_text[0] = selected_text[0][start_col - 1:]
    let selected_text = join(selected_text, "\n")
    let selected_text = start_char2 . selected_text . a:end_char
    " Replace the selection with the modified text
    call setline(start_line, strpart(getline(start_line), 0, start_col - 1) . selected_text . strpart(getline(end_line), end_col))
  endif
  call cursor(start_line, start_col + 1)
  normal! v
  let number = len(lines) > 0 ? 0 : 1
  call cursor(end_line, end_col + number)
endfunction


"function for search in a list if a text contain an element line is a string
"and listElm is a list
function! VimIncludesLine(line, listElm)
  for item in a:listElm
    if match(a:line, item) != -1
      return [1, item]
    endif
  endfor
  return [0, '']
endfunction

