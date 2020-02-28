CaseG VarG [(ConPatG Nothing,Nothing,ListG []),(ConsPatG EmptyPatG EmptyPatG,Nothing,ListG [EmptyG]),(ConsPatG EmptyPatG EmptyPatG,Nothing,ListG [EmptyG,EmptyG,EmptyG,EmptyG])]
match l with
| [] -> []
| x :: [] -> [x]
| head :: tail :: third :: fourth :: fifth -> [fourth ; third ; tail ; head]
