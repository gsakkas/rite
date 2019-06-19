LetG NonRec [(TuplePatG (fromList [EmptyPatG]),AppG [EmptyG,EmptyG,EmptyG])] VarG
let (_ , asd4) =
  padZero asd3 (asd2 :: b) in
(asd3 , asd4)
let (_ , res) =
  List.fold_left f base args in
res
