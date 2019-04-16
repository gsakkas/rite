
let rec digitsOfInt n =
  if n < 0
  then []
  else if (n mod 10) > 0 then [n mod 10] else [digitsOfInt (n / 10)];;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(3,6)-(3,11)
n <= 0
BopG VarG LitG

(5,8)-(5,69)
digitsOfInt (n / 10) @ [n mod 10]
AppG (fromList [AppG (fromList [EmptyG]),ListG (fromList [EmptyG])])

*)

(* type error slice
(2,4)-(5,71)
(2,21)-(5,69)
(3,3)-(5,69)
(5,8)-(5,69)
(5,47)-(5,69)
(5,48)-(5,59)
(5,48)-(5,68)
*)
