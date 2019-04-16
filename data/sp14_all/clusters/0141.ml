LamG VarPatG (CaseG EmptyG (fromList [(ConsPatG EmptyPatG EmptyPatG,Nothing,EmptyG),(ConPatG Nothing,Nothing,EmptyG)]))
fun b ->
  match b with
  | [] -> [a]
  | hd :: tl -> [a + hd]
fun l ->
  match l with
  | [] -> []
  | hd :: tl -> helper (hd :: xs)
                       l
