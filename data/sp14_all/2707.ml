
let rec digitsOfInt n =
  if n > 0 then [(digitsOfInt n) / 10; n mod 10] else [];;


(* fix

let rec digitsOfInt n = if n > 0 then [n; n mod 10] else [];;

*)

(* changed spans
(3,18)-(3,38)
n
VarG

*)

(* type error slice
(2,4)-(3,59)
(2,21)-(3,57)
(3,3)-(3,57)
(3,18)-(3,33)
(3,18)-(3,38)
(3,19)-(3,30)
(3,55)-(3,57)
*)
