
let rec digitsOfInt n = if n <= 0 then [] else (n mod 10) :: digitsOfInt;;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(2,61)-(2,72)
*)

(* type error slice
(2,3)-(2,74)
(2,20)-(2,72)
(2,47)-(2,72)
(2,61)-(2,72)
*)

(* all spans
(2,20)-(2,72)
(2,24)-(2,72)
(2,27)-(2,33)
(2,27)-(2,28)
(2,32)-(2,33)
(2,39)-(2,41)
(2,47)-(2,72)
(2,47)-(2,57)
(2,48)-(2,49)
(2,54)-(2,56)
(2,61)-(2,72)
*)
