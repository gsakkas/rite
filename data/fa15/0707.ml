
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

(* all spans
(2,20)-(3,63)
(3,2)-(3,63)
(3,5)-(3,10)
(3,5)-(3,6)
(3,9)-(3,10)
(3,16)-(3,27)
(3,16)-(3,25)
(3,26)-(3,27)
(3,33)-(3,63)
(3,33)-(3,42)
(3,43)-(3,54)
(3,55)-(3,63)
(3,56)-(3,57)
(3,60)-(3,62)
*)
