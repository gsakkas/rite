LamG (CaseG EmptyG (fromList [(Nothing,EmptyG),(Just EmptyG,EmptyG)]))
fun n ->
  match n with
  | 1 -> 1
  | _ when (n mod 2) = 0 -> n / 2
  | _ -> (3 * n) + 1
