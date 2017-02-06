
let rec digitsOfInt n =
  if n < 0 then [] else [digitsOfInt (n / 10); n mod 10];;


(* fix

let rec digitsOfInt n =
  if n < 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(3,25)-(3,57)
(3,26)-(3,45)
(3,48)-(3,56)
*)

(* type error slice
(2,21)-(3,57)
(3,3)-(3,57)
(3,6)-(3,7)
(3,6)-(3,11)
(3,17)-(3,19)
(3,25)-(3,57)
(3,26)-(3,37)
(3,26)-(3,45)
*)
