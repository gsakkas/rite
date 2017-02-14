
let rec digitsOfInt n =
  if n > 0 then [(digitsOfInt n) / 10; n mod 10] else [];;


(* fix

let rec digitsOfInt n = if n > 0 then [n; n mod 10] else [];;

*)

(* changed spans
(3,17)-(3,32)
(3,17)-(3,37)
(3,18)-(3,29)
(3,35)-(3,37)
(3,54)-(3,56)
*)

(* type error slice
(2,3)-(3,58)
(2,20)-(3,56)
(3,2)-(3,56)
(3,16)-(3,48)
(3,17)-(3,32)
(3,17)-(3,37)
(3,18)-(3,29)
*)
