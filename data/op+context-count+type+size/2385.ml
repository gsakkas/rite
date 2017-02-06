
let rec digitsOfInt n =
  if n <= 0 then [] else (match n with | n -> [digitsOfInt n]);;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (match n with | n -> [n mod 10]);;

*)

(* changed spans
(3,48)-(3,59)
(3,48)-(3,61)
*)

(* type error slice
(2,4)-(3,65)
(2,21)-(3,62)
(3,3)-(3,62)
(3,3)-(3,62)
(3,6)-(3,7)
(3,6)-(3,12)
(3,18)-(3,20)
(3,27)-(3,62)
(3,47)-(3,62)
(3,47)-(3,62)
(3,48)-(3,59)
(3,48)-(3,61)
(3,48)-(3,61)
(3,60)-(3,61)
*)
