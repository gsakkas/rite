CaseG VarG [(VarPatG,Nothing,ListG []),(WildPatG,Nothing,CaseG EmptyG [(EmptyPatG,Nothing,EmptyG),(EmptyPatG,Nothing,EmptyG)])]
EMPTY
match i with
| i -> []
| _ -> match l with
       | [] -> []
       | h :: t -> if List.length t = 0
                   then [h * i] @ mulByDigit i t
                   else (remainder i
                                   h) :: (mulByDigit i t)
