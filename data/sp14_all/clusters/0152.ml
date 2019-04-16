LetG NonRec (fromList [(VarPatG,LamG VarPatG EmptyG)]) (LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG)
let f =
  fun a ->
    fun x ->
      (let (i , j) = x in
       let (s , t) = a in
       (((i * j) + s) / 10 , (((i * j) + s) mod 10) :: t)) in
let base = (0 , []) in
let args =
  List.combine (List.rev (0 :: l1))
               (List.rev (clone (List.length l)
                                i)) in
let (_ , res) =
  List.fold_left f base args in
res
let f =
  fun a ->
    fun x -> fun p -> x (a p) in
let base = fun b -> b in
List.fold_left f base fs
