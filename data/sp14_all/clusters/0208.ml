IteG (BopG EmptyG EmptyG) (ListG (fromList [])) (AppG (fromList [EmptyG]))
if n <= 0
then []
else [n mod 10] @ digitsOfInt (n / 10)
