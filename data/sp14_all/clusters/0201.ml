IteG (BopG EmptyG EmptyG) (ListG (fromList [])) (CaseG (fromList [(LitPatG,Nothing,EmptyG),(WildPatG,Nothing,EmptyG)]))
if n < 0
then []
else (match n with
      | 0 -> [0]
      | _ -> digitsOfInt (n / 10) @ [n mod 10])
