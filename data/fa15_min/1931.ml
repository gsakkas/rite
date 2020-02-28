
let rec digitsOfInt n =
  if n < 0 then [] else (digitsOfInt (n / 10)) @ [n & 10];;


(* fix

let rec digitsOfInt n =
  if n < 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(3,51)-(3,57)
n mod 10
BopG VarG LitG

*)

(* type error slice
(3,6)-(3,7)
(3,6)-(3,11)
(3,10)-(3,11)
(3,51)-(3,52)
(3,51)-(3,57)
(3,53)-(3,54)
*)
