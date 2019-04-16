
let rec digitsOfInt n =
  if n > 0 then [[(digitsOfInt n) / 10]; n mod 10] else [];;


(* fix

let rec digitsOfInt n = if n > 0 then [n; n mod 10] else [];;

*)

(* changed spans
(3,18)-(3,40)
n
VarG

*)

(* type error slice
(2,4)-(3,61)
(2,21)-(3,59)
(3,3)-(3,59)
(3,17)-(3,51)
(3,18)-(3,40)
(3,19)-(3,34)
(3,19)-(3,39)
(3,20)-(3,31)
(3,42)-(3,50)
(3,57)-(3,59)
*)
