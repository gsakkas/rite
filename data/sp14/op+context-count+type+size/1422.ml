
let rec digitsOfInt n =
  if n <= 0 then [] else [((digitsOfInt (n / 10)), (n mod 10))];;


(* fix

let rec digitsOfInt n = if n <= 0 then [] else [n mod 10];;

*)

(* changed spans
(3,29)-(3,40)
(3,29)-(3,48)
(3,29)-(3,61)
(3,42)-(3,48)
*)

(* type error slice
(2,4)-(3,66)
(2,21)-(3,64)
(3,3)-(3,64)
(3,26)-(3,64)
(3,26)-(3,64)
(3,29)-(3,40)
(3,29)-(3,48)
(3,29)-(3,61)
*)
