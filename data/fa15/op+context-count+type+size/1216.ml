
let rec digitsOfInt n =
  if n < 0 then print_int 0 else (print_int n) / 10; digitsOfInt (n / 10);;


(* fix

let rec digitsOfInt n =
  if n < 0 then print_int 0 else print_int (n / 10); digitsOfInt (n / 10);;

*)

(* changed spans
(3,33)-(3,51)
(3,44)-(3,45)
*)

(* type error slice
(3,2)-(3,51)
(3,2)-(3,51)
(3,16)-(3,25)
(3,16)-(3,27)
(3,33)-(3,46)
(3,33)-(3,51)
(3,33)-(3,51)
(3,34)-(3,43)
*)
