LetG NonRec (fromList [(VarPatG,LamG VarPatG EmptyG)]) (LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG)
let f =
  fun a ->
    fun x -> a + (x * x) in
let base = 0 in
List.fold_left f base xs
let fx =
  fun a -> fun b -> a ^ b in
let base = "" in
List.fold_left fx base l
