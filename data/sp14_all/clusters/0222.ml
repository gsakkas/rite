CaseG (fromList [(TuplePatG (fromList [VarPatG]),Nothing,BopG EmptyG EmptyG)])
match x with
| (f , g) -> ((f + g) + carry) mod 10
