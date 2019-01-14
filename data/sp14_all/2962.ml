
let rec digitsOfInt n =
  if n > 0 then ((digitsOfInt n) / 10) @ [n mod 10] else [];;


(* fix

let rec digitsOfInt n = if n > 0 then [2] else [1];;

*)

(* changed spans
(3,57)-(3,59)
2
LitG

*)
