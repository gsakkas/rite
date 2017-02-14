
let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) + (digitsOfInt (n / 10));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(3,27)-(3,59)
*)

(* type error slice
(2,4)-(3,63)
(2,21)-(3,59)
(3,3)-(3,59)
(3,3)-(3,59)
(3,18)-(3,20)
(3,27)-(3,59)
(3,27)-(3,59)
(3,40)-(3,51)
(3,40)-(3,59)
*)
