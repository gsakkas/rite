CaseG VarG [(WildPatG,Nothing,ListG [EmptyG,EmptyG]),(ConsPatG EmptyPatG EmptyPatG,Nothing,AppG [EmptyG,EmptyG])]
match a with
| h :: t -> ((sum + h) / 10) :: (((sum + h) mod 10) :: t)
| _ -> [sum / 10 ; sum mod 10]
