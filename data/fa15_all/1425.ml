
let rec digitsOfInt n = if n <= 0 then [] else [digitsOfInt (n mod 10)];;


(* fix

let rec digitsOfInt n = if n <= 0 then [] else (digitsOfInt (n mod 10)) @ [];;

*)

(* changed spans
(2,47)-(2,71)
digitsOfInt (n mod 10) @ []
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(2,48)-(2,70)
(@)
VarG

*)
