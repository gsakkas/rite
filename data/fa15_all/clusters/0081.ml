CaseG (fromList [(TuplePatG (fromList [VarPatG]),Nothing,LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG)])
match a with
| (carry , list) -> (let num =
                       (l1e + l2e) + carry in
                     (num mod 9 , [7] @ list))
