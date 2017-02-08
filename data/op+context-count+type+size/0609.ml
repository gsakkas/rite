
let rec digitsOfInt n =
  if n > 0 then [digitsOfInt (n / 10); n mod 10] else [];;


(* fix

let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) @ [n mod 10] else [];;

*)

(* changed spans
(3,17)-(3,49)
(3,18)-(3,37)
(3,40)-(3,48)
*)

(* type error slice
(2,4)-(3,59)
(2,21)-(3,57)
(3,3)-(3,57)
(3,17)-(3,49)
(3,17)-(3,49)
(3,18)-(3,29)
(3,18)-(3,37)
*)
