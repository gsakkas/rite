
let rec digitsOfInt n =
  if n < 0 then [] else [(digitsOfInt n) / 10; n mod 10];;


(* fix

let rec digitsOfInt n =
  if n < 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(3,25)-(3,57)
(3,27)-(3,40)
(3,27)-(3,46)
(3,39)-(3,40)
(3,48)-(3,56)
*)

(* type error slice
(2,4)-(3,59)
(2,21)-(3,57)
(3,3)-(3,57)
(3,25)-(3,57)
(3,27)-(3,38)
(3,27)-(3,40)
(3,27)-(3,46)
*)
