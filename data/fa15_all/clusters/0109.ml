LamG VarPatG (CaseG (fromList [(ConsPatG EmptyPatG EmptyPatG,Nothing,EmptyG)]))
fun x ->
  match explode x with
  | h :: t -> false
