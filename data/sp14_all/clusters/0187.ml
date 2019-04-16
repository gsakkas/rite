LamG VarPatG (CaseG EmptyG (fromList [(VarPatG,Nothing,EmptyG),(LitPatG,Nothing,EmptyG)]))
fun n ->
  match n with
  | 0 -> []
  | n -> if n < 0
         then []
         else (n mod 10) :: (digitsOfInt (n / 10))
