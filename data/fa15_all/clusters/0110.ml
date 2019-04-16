LamG VarPatG (CaseG EmptyG (fromList [(ConsPatG EmptyPatG EmptyPatG,Nothing,EmptyG)]))
fun x ->
  match explode x with
  | h :: t -> false
