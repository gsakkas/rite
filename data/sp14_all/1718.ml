
let rec digitsOfInt n =
  if n <= 0 then [] else [n mod 10; (digitsOfInt n) / 10];;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else [n mod 10] @ (digitsOfInt (n / 10));;

*)

(* changed spans
(3,26)-(3,58)
[n mod 10] @ digitsOfInt (n / 10)
AppG [ListG [EmptyG],AppG [EmptyG]]

*)

(* type error slice
(2,4)-(3,60)
(2,21)-(3,58)
(3,3)-(3,58)
(3,26)-(3,58)
(3,37)-(3,52)
(3,37)-(3,57)
(3,38)-(3,49)
*)
