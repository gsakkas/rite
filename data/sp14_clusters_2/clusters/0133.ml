IteG (BopG EmptyG EmptyG) (ListG EmptyG Nothing) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))
if n < 0
then []
else (match n with
      | 0 -> [0]
      | _ -> digitsOfInt (n / 10) @ [n mod 10])
