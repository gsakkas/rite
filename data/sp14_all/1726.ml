
let rec digitsOfInt n =
  if n <= 0 then [] else [(digitsOfInt n) / 10; n mod 10];;


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
(3,27)-(3,42)
(3,27)-(3,47)
(3,28)-(3,39)
*)
