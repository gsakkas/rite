
let rec digitsOfInt n =
  if n <= 0 then [] else [n mod 10; (digitsOfInt n) / 10];;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else [n mod 10] @ (digitsOfInt (n / 10));;

*)

(* changed spans
(3,26)-(3,58)
(3,27)-(3,35)
(3,38)-(3,57)
(3,50)-(3,51)
*)

(* type error slice
(2,4)-(3,60)
(2,21)-(3,58)
(3,3)-(3,58)
(3,6)-(3,7)
(3,6)-(3,12)
(3,11)-(3,12)
(3,18)-(3,20)
(3,38)-(3,49)
(3,38)-(3,51)
(3,50)-(3,51)
*)
