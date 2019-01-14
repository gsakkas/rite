
let rec digitsOfInt n = if n < 0 then [] else [[]; n mod 10];;


(* fix

let rec digitsOfInt n = if n < 0 then [] else [] @ [n mod 10];;

*)

(* changed spans
(2,46)-(2,60)
[] @ [n mod 10]
AppG (fromList [ListG EmptyG Nothing])

(2,47)-(2,49)
(@)
VarG

(2,51)-(2,59)
[n mod 10]
ListG (BopG EmptyG EmptyG) Nothing

*)
