
let rec digitsOfInt n =
  if n < 0 then [] else [n mod 10] @ [digitsOfInt (n / 10)];;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(3,6)-(3,11)
(3,25)-(3,35)
(3,26)-(3,27)
(3,26)-(3,34)
(3,32)-(3,34)
(3,38)-(3,60)
*)

(* type error slice
(2,4)-(3,62)
(2,21)-(3,60)
(3,3)-(3,60)
(3,25)-(3,60)
(3,36)-(3,37)
(3,38)-(3,60)
(3,38)-(3,60)
(3,39)-(3,50)
(3,39)-(3,58)
*)
