
let rec digitsOfInt n =
  if n < 0 then [] else [((digitsOfInt n) / 10) :: (n mod 10)];;


(* fix

let rec digitsOfInt n =
  if n < 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(3,25)-(3,47)
digitsOfInt (n / 10) @ [n mod 10]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(3,26)-(3,41)
(@)
VarG

(3,39)-(3,40)
n / 10
BopG VarG LitG

(3,51)-(3,61)
[n mod 10]
ListG (BopG EmptyG EmptyG) Nothing

*)
