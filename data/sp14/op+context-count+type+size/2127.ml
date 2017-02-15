
let rec digitsOfInt n =
  if n <= 0 then [] else (match n with | n -> [digitsOfInt n]);;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (match n with | n -> [n mod 10]);;

*)

(* changed spans
(3,47)-(3,58)
(3,47)-(3,60)
*)

(* type error slice
(2,3)-(3,64)
(2,20)-(3,62)
(3,2)-(3,62)
(3,25)-(3,62)
(3,46)-(3,61)
(3,46)-(3,61)
(3,47)-(3,58)
(3,47)-(3,60)
*)
