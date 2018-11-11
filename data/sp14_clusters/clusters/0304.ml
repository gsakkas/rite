IteG (BopG EmptyG EmptyG) (ListG EmptyG Nothing) (AppG [EmptyG,EmptyG])
if n < 10
then [n]
else digitsOfInt (n / 10) @ [n mod 10]
if n < 10
then [n]
else digitsOfInt (n / 10) @ [n mod 10]
if n < 10
then [n]
else digitsOfInt (n / 10) @ [n mod 10]
if n < 10
then [n]
else digitsOfInt (n / 10) @ [n mod 10]
if n <= 0
then []
else [n mod 10] @ digitsOfInt (n / 10)
