
let rec digitsOfInt n = if n < 0 then [] else n mod 10; (digitsOfInt n) / 10;;


(* fix

let rec digitsOfInt n =
  if n < 0 then print_int 0 else print_int (n / 10); digitsOfInt (n / 10);;

*)

(* changed spans
(2,39)-(2,41)
(2,47)-(2,48)
(2,47)-(2,55)
(2,58)-(2,77)
(2,70)-(2,71)
(2,75)-(2,77)
*)

(* type error slice
(2,25)-(2,55)
(2,25)-(2,55)
(2,25)-(2,77)
(2,39)-(2,41)
(2,47)-(2,55)
*)
