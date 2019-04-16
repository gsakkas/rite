LetG NonRec (fromList [(VarPatG,VarG)]) (LetG NonRec (fromList [(TuplePatG (fromList [EmptyPatG]),EmptyG)]) EmptyG)
let args = l2 in
let (_ , res) =
  List.fold_left f base args in
res
