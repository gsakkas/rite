IteG (BopG EmptyG EmptyG) (ListG (fromList [])) (AppG (fromList [EmptyG]))
if n > 0
then []
else digitsOfInt (n / 10) @ [n mod 10]
if n < 0
then []
else digitsOfInt (n / 10) @ [n mod 10]
if n = 0
then []
else x :: (clone x (n - 1))
