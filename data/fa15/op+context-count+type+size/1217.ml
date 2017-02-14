
let rec digitsOfInt n =
  if n < 0 then [] else (n mod 10) :: ((digitsOfInt n) / 10);;


(* fix

let rec digitsOfInt n =
  if n < 0 then print_int 0 else print_int (n / 10); digitsOfInt (n / 10);;

*)

(* changed spans
(3,3)-(3,60)
(3,17)-(3,19)
(3,26)-(3,27)
(3,26)-(3,34)
(3,26)-(3,60)
(3,41)-(3,60)
(3,53)-(3,54)
(3,58)-(3,60)
*)

(* type error slice
(2,4)-(3,63)
(2,21)-(3,60)
(3,3)-(3,60)
(3,26)-(3,60)
(3,26)-(3,60)
(3,41)-(3,52)
(3,41)-(3,54)
(3,41)-(3,60)
(3,41)-(3,60)
*)
