
let rec digitsOfInt n =
  if n <= 0 then [] else (n - ((n / 10) * 10)) :: ((digitsOfInt n) / 10);;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (n - ((n / 10) * 10)) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(3,53)-(3,72)
(3,65)-(3,66)
*)

(* type error slice
(2,4)-(3,75)
(2,21)-(3,72)
(3,3)-(3,72)
(3,6)-(3,7)
(3,6)-(3,12)
(3,11)-(3,12)
(3,18)-(3,20)
(3,27)-(3,45)
(3,27)-(3,72)
(3,53)-(3,64)
(3,53)-(3,66)
(3,53)-(3,72)
(3,65)-(3,66)
*)
