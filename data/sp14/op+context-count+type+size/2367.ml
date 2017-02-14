
let rec digitsOfInt n =
  if n <= 0 then [] else (match n with | n -> [digitsOfInt (n mod 10)]);;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (match n with | n -> [n mod 10]);;

*)

(* changed spans
(3,47)-(3,58)
(3,47)-(3,69)
*)

(* type error slice
(2,3)-(3,73)
(2,20)-(3,71)
(3,2)-(3,71)
(3,25)-(3,71)
(3,46)-(3,70)
(3,46)-(3,70)
(3,47)-(3,58)
(3,47)-(3,69)
*)
