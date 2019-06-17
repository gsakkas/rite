LetG NonRec [(TuplePatG (fromList [EmptyPatG]),AppG [EmptyG,EmptyG])] (AppG [EmptyG,EmptyG])
let (l1' , l2') =
  padZero l1 l2 in
List.combine l1' l2'
let (_ , res) =
  List.fold_left f base args in
res
let (x , y) =
  makeTuple l1 l2 in
List.combine x y
EMPTY
let (x , res) =
  List.fold_left f base args in
res @ helper (List.length l2 * 2)
             x
