IteG (BopG EmptyG EmptyG) (ListG [EmptyG]) (AppG [EmptyG])
EMPTY
if n < 10
then [n]
else digitsOfInt (n / 10)
if n = 0
then []
else x :: (clone x (n - 1))
