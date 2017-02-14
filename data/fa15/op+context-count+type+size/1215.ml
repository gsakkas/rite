
let rec digitsOfInt n = if n < 0 then [] else n mod 10; (digitsOfInt n) / 10;;


(* fix

let rec digitsOfInt n =
  if n < 0 then print_int 0 else print_int (n / 10); digitsOfInt (n / 10);;

*)

(* changed spans
(2,38)-(2,40)
(2,46)-(2,47)
(2,46)-(2,54)
(2,56)-(2,76)
(2,69)-(2,70)
(2,74)-(2,76)
*)

(* type error slice
(2,24)-(2,54)
(2,24)-(2,54)
(2,24)-(2,76)
(2,38)-(2,40)
(2,46)-(2,54)
*)
