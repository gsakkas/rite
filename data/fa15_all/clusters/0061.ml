LamG VarPatG (CaseG (fromList [(ConsPatG EmptyPatG EmptyPatG,Nothing,EmptyG),(ConPatG Nothing,Nothing,EmptyG)]))
fun l ->
  match l with
  | [] -> []
  | h :: t -> listReverse t @ [h]
fun x ->
  match x with
  | [] -> true
  | h :: t -> if getHead x = getHead (listReverse x)
              then matchHeads (getTail (listReverse t))
              else false
function
  | [] -> l
  | h :: t -> listReverseHelper (h :: l)
                                t
