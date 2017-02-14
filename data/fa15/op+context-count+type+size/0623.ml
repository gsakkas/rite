
let rec digitsOfInt n =
  if n > 0 then [digitsOfInt (n / 10); n mod 10] else [];;


(* fix

let rec digitsOfInt n = if n > 0 then [n / 10; n mod 10] else [];;

*)

(* changed spans
(3,17)-(3,28)
(3,17)-(3,37)
*)

(* type error slice
(2,3)-(3,58)
(2,20)-(3,56)
(3,2)-(3,56)
(3,16)-(3,48)
(3,16)-(3,48)
(3,17)-(3,28)
(3,17)-(3,37)
*)
