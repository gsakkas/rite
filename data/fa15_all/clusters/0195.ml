CaseG VarG (fromList [(Nothing,CaseG EmptyG (fromList [(Nothing,EmptyG)])),(Nothing,ListG EmptyG Nothing)])
match i with
| i -> []
| _ -> match l with
       | [] -> []
       | h :: t -> if List.length t = 0
                   then [h * i] @ mulByDigit i t
                   else (remainder i
                                   h) :: (mulByDigit i t)
