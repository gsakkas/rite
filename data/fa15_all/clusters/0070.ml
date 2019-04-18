LetG NonRec (fromList [(VarPatG,AppG (fromList [EmptyG]))]) VarG
let res =
  List.fold_left f base args in
res
