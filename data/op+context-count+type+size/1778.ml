
let rec digitsOfInt n =
  if n <= 0 then [] else [n mod 10] @ [digitsOfInt (n / 10)];;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else [n mod 10] @ (digitsOfInt (n / 10));;

*)

(* changed spans
(3,39)-(3,61)
*)

(* type error slice
(2,21)-(3,61)
(3,3)-(3,61)
(3,6)-(3,7)
(3,6)-(3,12)
(3,18)-(3,20)
(3,26)-(3,61)
(3,37)-(3,38)
(3,39)-(3,61)
(3,39)-(3,61)
(3,40)-(3,51)
(3,40)-(3,59)
*)
