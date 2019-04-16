LetG NonRec (fromList [(VarPatG,ListG (fromList []))]) (IteG EmptyG EmptyG EmptyG)
let myList = [] in
if n <= 0
then []
else if n < 10
     then [n]
     else digitsOfInt (n / 10) @ [n mod 10]
let accum = [] in
if n < 1
then []
else clone x n
let myList = [] in
if n <= 0
then []
else (n mod 10) :: myList
