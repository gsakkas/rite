
let rec digitsOfInt n =
  if n < 0 then print_int 0 else print_int digitsOfInt (n / 10);;


(* fix

let rec digitsOfInt n =
  if n < 0 then print_int 0 else print_int (n / 10); digitsOfInt (n / 10);;

*)

(* changed spans
(3,3)-(3,63)
(3,34)-(3,63)
(3,44)-(3,55)
*)

(* type error slice
(3,34)-(3,43)
(3,34)-(3,63)
*)
