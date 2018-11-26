
let rec digitsOfInt n =
  if n > 0 then ((digitsOfInt n) / 10) @ [n mod 10] else [];;


(* fix

let rec digitsOfInt n = if n > 0 then [n; n mod 10] else [];;

*)

(* changed spans
(3,18)-(3,29)
[n ; n mod 10]
ListG VarG Nothing

*)
