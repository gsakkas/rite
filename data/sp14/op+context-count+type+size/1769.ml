
let rec digitsOfInt n =
  if n <= 0 then [] else [(digitsOfInt n) / 10; n mod 10];;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else [n mod 10] @ (digitsOfInt (n / 10));;

*)

(* changed spans
(3,26)-(3,58)
(3,28)-(3,39)
(3,28)-(3,41)
(3,28)-(3,47)
(3,40)-(3,41)
(3,49)-(3,50)
(3,49)-(3,57)
*)

(* type error slice
(2,4)-(3,60)
(2,21)-(3,58)
(3,3)-(3,58)
(3,26)-(3,58)
(3,28)-(3,39)
(3,28)-(3,41)
(3,28)-(3,47)
*)
