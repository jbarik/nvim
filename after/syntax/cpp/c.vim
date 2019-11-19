syn match jpOper1 "||\|&&\|[-+.*]\|[<>]\|&"
syn match jpOper1 "\(==\|!=\|>=\|<=\|=\~\|!\~\|>\|<\|=\)"

syn match jpOper2 "(\|)"
syn match jpOper2 "{\|}"
syn match jpOper2 /\[/
syn match jpOper2 /\]/
syn match jpOper1 /</
syn match jpOper1 />/
syn match jpOper1 /!/

syn match cDelimiter ",\|;\|:\|?"

hi def link jpOper1 Operator     	
hi def link cCustomFunc Function
