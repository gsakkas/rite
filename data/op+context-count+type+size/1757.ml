
let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) @ [digitsOfInt (n / 10)];;


(* fix

let rec digitsOfInt n =
  if n <= 0
  then []
  else (let digit = digitsOfInt (n / 10) in digit @ [n mod 10]);;

*)

(* changed spans
(3,27)-(3,28)
(3,27)-(3,35)
(3,27)-(3,61)
(3,33)-(3,35)
(3,37)-(3,38)
(3,39)-(3,61)
*)

(* type error slice
(3,27)-(3,35)
(3,27)-(3,61)
(3,37)-(3,38)
(3,39)-(3,61)
*)
