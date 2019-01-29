
let rec digitsOfInt n = if n < 0 then [] else n mod 10;;


(* fix

let rec digitsOfInt n = if n < 0 then [] else digitsOfInt (n / 10);;

*)

(* changed spans
(2,46)-(2,47)
digitsOfInt
VarG

(2,46)-(2,47)
n / 10
BopG VarG LitG

(2,46)-(2,54)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

*)
