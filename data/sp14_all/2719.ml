
let rec digitsOfInt n = if n > 0 then [digitsOfInt (n / 10); n mod 10] else 0;;


(* fix

let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) @ [n mod 10] else [];;

*)

(* changed spans
(2,38)-(2,70)
digitsOfInt (n / 10) @ [n mod 10]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(2,39)-(2,59)
(@)
VarG

(2,61)-(2,69)
[n mod 10]
ListG (BopG EmptyG EmptyG) Nothing

(2,76)-(2,77)
[]
ListG EmptyG Nothing

*)
