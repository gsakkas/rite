CaseG VarG [(Nothing,ListG EmptyG Nothing),(Nothing,ListG EmptyG Nothing),(Nothing,ListG EmptyG Nothing)]
match l with
| [] -> []
| x :: [] -> [x]
| head :: tail :: third -> [head ; tail]
match l with
| [] -> []
| x :: [] -> [x]
| head :: tail :: third -> [head ; tail]
match l with
| [] -> []
| x :: [] -> [x]
| head :: tail :: third :: fourth :: fifth -> [fourth ; third ; tail ; head]
