
let rec digitsOfInt n =
  if n > 0 then [digitsOfInt ((n - (n mod 10)) / 10); n mod 10] else [];;


(* fix

let rec digitsOfInt n =
  if n > 0 then (digitsOfInt ((n - (n mod 10)) / 10)) @ [n mod 10] else [];;

*)

(* changed spans
(3,16)-(3,63)
digitsOfInt ((n - (n mod 10)) / 10) @ [n mod 10]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(3,17)-(3,52)
(@)
VarG

(3,54)-(3,62)
[n mod 10]
ListG (BopG EmptyG EmptyG) Nothing

*)
