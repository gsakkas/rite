CaseG VarG (fromList [(ConsPatG VarPatG VarPatG,Nothing,IteG EmptyG EmptyG EmptyG),(ConPatG Nothing,Nothing,ListG (fromList []))])
match l with
| [] -> []
| x :: xs' -> if x = 0
              then rmzhelp xs'
              else x :: xs'
match l with
| [] -> []
| h :: t -> if h = 0
            then removeZero t
            else h :: t
