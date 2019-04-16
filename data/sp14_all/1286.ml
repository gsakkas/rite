
let rec digitsOfInt n =
  if n <= 0 then [] else (match n with | n -> [digitsOfInt (n mod 10)]);;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (match n with | n -> [n mod 10]);;

*)

(* changed spans
(3,48)-(3,70)
n mod 10
BopG VarG LitG

*)

(* type error slice
(2,4)-(3,74)
(2,21)-(3,72)
(3,3)-(3,72)
(3,26)-(3,72)
(3,47)-(3,71)
(3,48)-(3,59)
(3,48)-(3,70)
*)
