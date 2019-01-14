
let rec digitsOfInt n =
  let m = n in if n < 0 then [] else [[digitsOfInt (m / 10)]; n mod 10];;


(* fix

let rec digitsOfInt n =
  if n < 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(3,38)-(3,60)
digitsOfInt (n / 10) @ [n mod 10]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(3,39)-(3,59)
(@)
VarG

(3,52)-(3,53)
n
VarG

(3,62)-(3,70)
[n mod 10]
ListG (BopG EmptyG EmptyG) Nothing

*)
