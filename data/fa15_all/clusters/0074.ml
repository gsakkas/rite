LetG NonRec (fromList [(TuplePatG (fromList [VarPatG]),AppG (fromList [EmptyG]))]) (AppG (fromList [EmptyG]))
let (l1' , l2') =
  padZero l1 l2 in
List.combine l1' l2'
let (x , y) =
  makeTuple l1 l2 in
List.combine x y
let (x , res) =
  List.fold_left f base args in
res @ helper (List.length l2 * 2)
             x
