
let rec digitsOfInt n =
  if n < 0 then [] else (n mod 10) :: ((digitsOfInt n) / 10);;


(* fix

let rec digitsOfInt n =
  if n < 0 then print_int 0 else print_int (n / 10); digitsOfInt (n / 10);;

*)

(* changed spans
(3,2)-(3,60)
(3,16)-(3,18)
(3,24)-(3,34)
(3,24)-(3,60)
(3,25)-(3,26)
(3,38)-(3,60)
(3,52)-(3,53)
(3,57)-(3,59)
*)

(* type error slice
(2,3)-(3,62)
(2,20)-(3,60)
(3,2)-(3,60)
(3,24)-(3,60)
(3,24)-(3,60)
(3,38)-(3,60)
(3,38)-(3,60)
(3,39)-(3,54)
(3,40)-(3,51)
*)
