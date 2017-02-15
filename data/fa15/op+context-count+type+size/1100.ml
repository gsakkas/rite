
let rec digitsOfInt n =
  if n < 0 then print_int 0 else print_int digitsOfInt (n / 10);;


(* fix

let rec digitsOfInt n =
  if n < 0 then print_int 0 else print_int (n / 10); digitsOfInt (n / 10);;

*)

(* changed spans
(3,2)-(3,63)
(3,33)-(3,63)
(3,43)-(3,54)
*)

(* type error slice
(3,33)-(3,42)
(3,33)-(3,63)
*)
