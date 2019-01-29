CaseG VarG (fromList [(Nothing,BopG EmptyG EmptyG),(Nothing,LitG),(Just (BopG EmptyG EmptyG),BopG EmptyG EmptyG)])
match n with
| 1 -> 1
| _ when (n mod 2) = 0 -> n / 2
| _ -> (3 * n) + 1
