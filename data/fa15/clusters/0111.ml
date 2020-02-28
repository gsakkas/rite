CaseG VarG [(ConPatG Nothing,Nothing,ListG []),(ConsPatG EmptyPatG EmptyPatG,Nothing,IteG EmptyG EmptyG EmptyG)]
EMPTY
match l with
| [] -> []
| h :: t -> if List.length t = 0
            then [h * i] @ mulByDigit i t
            else (remainder i
                            h) :: (mulByDigit i t)
