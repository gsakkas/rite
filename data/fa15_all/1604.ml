
let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | [] -> [] | h::t -> [h; digitsOfInt t]);;


(* fix

let rec digitsOfInt n = if n < 0 then [] else [] @ [n mod 10];;

*)

(* changed spans
(5,14)-(5,15)
[] @ [n mod 10]
AppG (fromList [ListG EmptyG Nothing])

(5,29)-(5,31)
(@)
VarG

(5,58)-(5,59)
[n mod 10]
ListG (BopG EmptyG EmptyG) Nothing

*)
