
let rec digitsOfInt n =
  if n <= 0 then [] else [n mod 10] @ ((digitsOfInt n) / 10);;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else [n mod 10] @ (digitsOfInt (n / 10));;

*)

(* changed spans
(3,41)-(3,60)
(3,53)-(3,54)
*)

(* type error slice
(2,4)-(3,63)
(2,21)-(3,60)
(3,3)-(3,60)
(3,6)-(3,7)
(3,6)-(3,12)
(3,11)-(3,12)
(3,18)-(3,20)
(3,26)-(3,36)
(3,26)-(3,60)
(3,27)-(3,35)
(3,37)-(3,38)
(3,41)-(3,52)
(3,41)-(3,54)
(3,41)-(3,60)
(3,53)-(3,54)
*)
