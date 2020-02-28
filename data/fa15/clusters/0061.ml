LamG VarPatG (CaseG EmptyG [(EmptyPatG,Nothing,EmptyG)])
EMPTY
fun x ->
  match explode x with
  | h :: t -> false
fun x ->
  match x with
  | [] -> true
  | h :: t -> if getHead x = getHead (listReverse x)
              then matchHeads (getTail (listReverse t))
              else false
fun l ->
  match l with
  | [] -> []
  | h :: t -> listReverse t @ [h]
function
  | [] -> l
  | h :: t -> listReverseHelper (h :: l)
                                t
