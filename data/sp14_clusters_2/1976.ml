
let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | 0 -> [0] | _ -> digitsOfInt (n / 10) []);;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | 0 -> [] | _ -> (digitsOfInt (n / 10)) @ [n mod 10]);;

*)

(* changed spans
(5,29)-(5,30)
[]
ListG EmptyG Nothing

(5,39)-(5,50)
(@)
VarG

(5,39)-(5,50)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

(5,60)-(5,62)
[n mod 10]
ListG (BopG EmptyG EmptyG) Nothing

*)
