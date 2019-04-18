CaseG (fromList [(ConsPatG VarPatG VarPatG,Nothing,IteG EmptyG EmptyG EmptyG),(ConPatG Nothing,Nothing,ListG (fromList []))])
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
match l with
| [] -> []
| h :: t -> if List.length t = 0
            then [h * i] @ mulByDigit i t
            else (remainder i
                            h) :: (mulByDigit i t)
