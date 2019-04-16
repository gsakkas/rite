LetG NonRec (fromList [(TuplePatG (fromList [VarPatG,WildPatG]),AppG (fromList [EmptyG]))]) VarG
let (_ , res) =
  List.fold_left f base args in
res
