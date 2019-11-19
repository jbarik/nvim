syn match jpOper1 "||\|&&\|[-+.*]\|[<>]\|&"
syn match jpOper1 "\(==\|!=\|>=\|<=\|=\~\|!\~\|>\|<\|=\)"

syn match jpOper2 "(\|)"
syn match jpOper2 "{\|}"
syn match jpOper2 /\[/
syn match jpOper2 /\]/

""syn match jpOper3 ",\|;\|:\|?"

hi def link jpOper1 Operator     	
