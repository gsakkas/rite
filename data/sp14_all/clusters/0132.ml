CaseG VarG (fromList [(ConsPatG VarPatG (ConsPatG EmptyPatG EmptyPatG),Nothing,ListG (fromList [EmptyG])),(ConsPatG VarPatG (ConPatG Nothing),Nothing,ListG (fromList [EmptyG])),(ConPatG Nothing,Nothing,ListG (fromList []))])
match l with
| [] -> []
| x :: [] -> [x]
| head :: tail :: third -> [head ; tail]
match l with
| [] -> []
| x :: [] -> [x]
| head :: tail :: third :: fourth :: fifth -> [fourth ; third ; tail ; head]
