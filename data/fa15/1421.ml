
let rec digitsOfInt n =
  if n < 0 then [] else (n mod 10) :: [] :: (digitsOfInt (n / 10));;


(* fix

let rec digitsOfInt n =
  if n < 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(3,38)-(3,40)
(3,38)-(3,66)
*)

(* type error slice
(3,24)-(3,34)
(3,24)-(3,66)
(3,24)-(3,66)
(3,38)-(3,40)
(3,38)-(3,66)
(3,38)-(3,66)
*)

(* all spans
(2,20)-(3,66)
(3,2)-(3,66)
(3,5)-(3,10)
(3,5)-(3,6)
(3,9)-(3,10)
(3,16)-(3,18)
(3,24)-(3,66)
(3,24)-(3,34)
(3,25)-(3,26)
(3,31)-(3,33)
(3,38)-(3,66)
(3,38)-(3,40)
(3,44)-(3,66)
(3,45)-(3,56)
(3,57)-(3,65)
(3,58)-(3,59)
(3,62)-(3,64)
*)
