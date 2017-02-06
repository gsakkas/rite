
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) :: (n mod 10);;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(3,27)-(3,46)
(3,27)-(3,61)
(3,53)-(3,61)
*)

(* type error slice
(2,4)-(3,64)
(2,21)-(3,61)
(3,3)-(3,61)
(3,3)-(3,61)
(3,6)-(3,7)
(3,6)-(3,12)
(3,18)-(3,20)
(3,27)-(3,38)
(3,27)-(3,46)
(3,27)-(3,61)
(3,53)-(3,61)
*)
