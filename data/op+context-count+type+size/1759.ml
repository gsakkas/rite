
let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) :: ((digitsOfInt n) / 10);;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(3,42)-(3,61)
(3,54)-(3,55)
*)

(* type error slice
(2,4)-(3,64)
(2,21)-(3,61)
(3,3)-(3,61)
(3,6)-(3,7)
(3,6)-(3,12)
(3,11)-(3,12)
(3,18)-(3,20)
(3,27)-(3,35)
(3,27)-(3,61)
(3,42)-(3,53)
(3,42)-(3,55)
(3,42)-(3,61)
(3,54)-(3,55)
*)
