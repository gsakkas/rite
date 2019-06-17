CaseG VarG [(LitPatG,Nothing,TupleG [EmptyG,EmptyG]),(WildPatG,Nothing,TupleG [EmptyG,EmptyG])]
EMPTY
match c with
| 0 -> (a1 @ [(x1 + x2) / 10] , a2 @ [(x1 + x2) mod 10])
| _ -> (a1 @ [((x1 + x2) + c) / 10] , a2 @ [((x1 + x2) + c) mod 10])
