
let rec digOfIntHelper h = match h > 0 with | true  -> 1 | false  -> 0;;

let rec digitsOfInt n =
  match n with
  | 0 -> []
  | 0::[] -> []
  | 1 -> []
  | true  -> [digOfIntHelper n; []; n mod 10]
  | false  -> [];;


(* fix

let rec digitsOfInt n =
  match n > 0 with
  | false  -> []
  | true  ->
      (match n > 9 with
       | false  -> n :: (digitsOfInt n)
       | true  -> digitsOfInt (n mod 10));;

*)

(* changed spans
(5,2)-(10,16)
match n > 0 with
| false -> []
| true -> match n > 9 with
          | false -> n :: (digitsOfInt n)
          | true -> digitsOfInt (n mod 10)
CaseG (BopG EmptyG EmptyG) [(Nothing,ListG EmptyG Nothing),(Nothing,CaseG EmptyG [(Nothing,EmptyG),(Nothing,EmptyG)])]

(5,8)-(5,9)
n > 0
BopG VarG LitG

(7,13)-(7,15)
0
LitG

(9,13)-(9,45)
match n > 9 with
| false -> n :: (digitsOfInt n)
| true -> digitsOfInt (n mod 10)
CaseG (BopG EmptyG EmptyG) [(Nothing,ConAppG (Just EmptyG) Nothing),(Nothing,AppG [EmptyG])]

(9,14)-(9,28)
digitsOfInt
VarG

(9,14)-(9,30)
n
VarG

(9,14)-(9,30)
n
VarG

(9,14)-(9,30)
n > 9
BopG VarG LitG

(9,14)-(9,30)
9
LitG

(9,14)-(9,30)
n :: (digitsOfInt n)
ConAppG (Just (TupleG [VarG,AppG [VarG]])) Nothing

(9,32)-(9,34)
digitsOfInt (n mod 10)
AppG [BopG EmptyG EmptyG]

(9,36)-(9,44)
digitsOfInt
VarG

*)
