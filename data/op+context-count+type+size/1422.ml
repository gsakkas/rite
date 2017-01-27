
let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) :: [] :: (digitsOfInt (n / 10));;


(* fix

let rec digitsOfInt n = if n <= 0 then [] else [n mod 10];;

*)

(* changed spans
(3,27)-(3,66)
(3,40)-(3,66)
*)

(* type error slice
(2,4)-(3,70)
(2,21)-(3,66)
(3,3)-(3,66)
(3,6)-(3,7)
(3,6)-(3,12)
(3,11)-(3,12)
(3,18)-(3,20)
(3,27)-(3,35)
(3,27)-(3,66)
(3,40)-(3,66)
(3,47)-(3,58)
(3,47)-(3,66)
(3,60)-(3,66)
*)
