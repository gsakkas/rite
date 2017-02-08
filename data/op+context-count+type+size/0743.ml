
let rec digitsOfInt n = (n mod 10) :: ((digitsOfInt n) / 10);;


(* fix

let rec digitsOfInt n = (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(2,41)-(2,60)
(2,53)-(2,54)
*)

(* type error slice
(2,4)-(2,63)
(2,21)-(2,60)
(2,26)-(2,60)
(2,26)-(2,60)
(2,41)-(2,52)
(2,41)-(2,54)
(2,41)-(2,60)
(2,41)-(2,60)
*)
