CaseG VarG (fromList [(LitPatG,Nothing,TupleG (fromList [EmptyG])),(WildPatG,Nothing,TupleG (fromList [EmptyG]))])
match c with
| 0 -> (a1 @ [(x1 + x2) / 10] , a2 @ [(x1 + x2) mod 10])
| _ -> (a1 @ [((x1 + x2) + c) / 10] , a2 @ [((x1 + x2) + c) mod 10])
