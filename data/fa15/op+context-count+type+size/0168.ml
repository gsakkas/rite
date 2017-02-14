
let rec digitsOfInt n =
  if n < 0 then [] else [(digitsOfInt n) / 10; n mod 10];;


(* fix

let rec digitsOfInt n =
  if n < 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(3,24)-(3,56)
(3,25)-(3,40)
(3,25)-(3,45)
(3,38)-(3,39)
(3,47)-(3,55)
*)

(* type error slice
(2,3)-(3,58)
(2,20)-(3,56)
(3,2)-(3,56)
(3,24)-(3,56)
(3,25)-(3,40)
(3,25)-(3,45)
(3,26)-(3,37)
*)
