
let rec digitsOfInt n = if n < 0 then 7;;


(* fix

let rec digitsOfInt n = if n < 0 then [7] else [8];;

*)

(* changed spans
(2,24)-(2,39)
[8]
ListG LitG Nothing

(2,38)-(2,39)
[7]
ListG LitG Nothing

*)
