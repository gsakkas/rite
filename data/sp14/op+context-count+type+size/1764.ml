
let rec digitsOfInt n =
  if n <= 0 then [] else [n mod 10] @ [(digitsOfInt n) / 10];;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else [n mod 10] @ (digitsOfInt (n / 10));;

*)

(* changed spans
(3,39)-(3,61)
(3,41)-(3,60)
(3,53)-(3,54)
*)

(* type error slice
(2,4)-(3,63)
(2,21)-(3,61)
(3,3)-(3,61)
(3,26)-(3,61)
(3,37)-(3,38)
(3,41)-(3,52)
(3,41)-(3,54)
(3,41)-(3,60)
*)
