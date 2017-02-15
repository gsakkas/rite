
let rec digitsOfInt n =
  if n > 0 then [digitsOfInt (n mod 10); n mod 10] else [];;


(* fix

let rec digitsOfInt n = if n > 0 then [n mod 100; n mod 10] else [];;

*)

(* changed spans
(3,17)-(3,28)
(3,17)-(3,39)
(3,36)-(3,38)
*)

(* type error slice
(2,3)-(3,60)
(2,20)-(3,58)
(3,2)-(3,58)
(3,16)-(3,50)
(3,16)-(3,50)
(3,17)-(3,28)
(3,17)-(3,39)
*)
