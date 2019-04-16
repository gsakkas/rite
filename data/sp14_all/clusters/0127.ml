IteG (BopG EmptyG EmptyG) (ListG (fromList [EmptyG])) (AppG (fromList [EmptyG]))
if n < 10
then [n]
else digitsOfInt (n / 10) @ [n mod 10]
