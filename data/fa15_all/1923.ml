
let rec digitsOfInt n = if n < 0 then [] else n mod 10; (digitsOfInt n) / 10;;


(* fix

let rec digitsOfInt n =
  if n < 0 then print_int 0 else print_int (n / 10); digitsOfInt (n / 10);;

*)

(* changed spans
(2,39)-(2,41)
print_int 0
AppG [LitG]

(2,47)-(2,55)
print_int (n / 10)
AppG [BopG EmptyG EmptyG]

(2,57)-(2,77)
digitsOfInt (n / 10)
AppG [BopG EmptyG EmptyG]

*)

(* type error slice
(2,25)-(2,55)
(2,39)-(2,41)
(2,47)-(2,55)
*)
