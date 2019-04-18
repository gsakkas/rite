
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
(5,3)-(10,17)
match n > 0 with
| false -> []
| true -> match n > 9 with
          | false -> n :: (digitsOfInt n)
          | true -> digitsOfInt (n mod 10)
CaseG (fromList [(LitPatG,Nothing,CaseG (fromList [(LitPatG,Nothing,EmptyG)])),(LitPatG,Nothing,ListG (fromList []))])

(5,9)-(5,10)
n > 0
BopG VarG LitG

(7,14)-(7,16)
match n > 9 with
| false -> n :: (digitsOfInt n)
| true -> digitsOfInt (n mod 10)
CaseG (fromList [(LitPatG,Nothing,AppG (fromList [EmptyG]))])

*)

(* type error slice
(2,4)-(2,73)
(2,24)-(2,71)
(2,28)-(2,71)
(2,34)-(2,35)
(2,34)-(2,39)
(2,38)-(2,39)
(2,56)-(2,57)
(5,3)-(10,17)
(5,9)-(5,10)
(9,14)-(9,46)
(9,15)-(9,29)
(9,15)-(9,31)
(9,30)-(9,31)
(9,33)-(9,35)
*)
