
let rec digitsOfInt n =
  if n <= 0 then [] else (match n with | n -> [digitsOfInt (n mod 10)]);;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (match n with | n -> [n mod 10]);;

*)

(* changed spans
(3,48)-(3,59)
(3,48)-(3,69)
*)

(* type error slice
(2,4)-(3,74)
(2,21)-(3,71)
(3,3)-(3,71)
(3,3)-(3,71)
(3,6)-(3,7)
(3,6)-(3,12)
(3,18)-(3,20)
(3,27)-(3,71)
(3,47)-(3,71)
(3,47)-(3,71)
(3,48)-(3,59)
(3,48)-(3,69)
(3,61)-(3,62)
*)
