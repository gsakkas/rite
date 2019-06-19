CaseG VarG [(ConPatG Nothing,Nothing,ListG [EmptyG]),(ConsPatG EmptyPatG EmptyPatG,Nothing,AppG [EmptyG,EmptyG])]
EMPTY
match t with
| [] -> [remainder i h]
| h' :: t' -> [h' * i] @ mulByDigit i
                                    t'
