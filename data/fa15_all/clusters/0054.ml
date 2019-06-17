CaseG VarG [(TuplePatG (fromList [EmptyPatG]),Nothing,LetG NonRec [(EmptyPatG,EmptyG)] EmptyG)]
match a with
| (carry , list) -> (let num =
                       (l1e + l2e) + carry in
                     (num mod 9 , [7] @ list))
EMPTY
