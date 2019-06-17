CaseG VarG [(TuplePatG (fromList [EmptyPatG]),Nothing,BopG EmptyG EmptyG)]
match x with
| (f , g) -> ((f + g) + carry) mod 10
