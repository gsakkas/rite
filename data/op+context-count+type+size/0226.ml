
let rec digitsOfInt n =
  if n <= 0 then [] else [digitsOfInt (n / 10); n mod 10];;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(3,26)-(3,58)
(3,27)-(3,46)
(3,49)-(3,57)
*)

(* type error slice
(2,21)-(3,58)
(3,3)-(3,58)
(3,6)-(3,7)
(3,6)-(3,12)
(3,18)-(3,20)
(3,26)-(3,58)
(3,27)-(3,38)
(3,27)-(3,46)
*)
