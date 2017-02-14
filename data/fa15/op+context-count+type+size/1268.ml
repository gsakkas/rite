
let rec digitsOfInt n =
  if n < 0 then [] else (digitsOfInt (n / 10)) @ [n & 10];;


(* fix

let rec digitsOfInt n =
  if n < 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(3,50)-(3,56)
(3,52)-(3,53)
*)

(* type error slice
(3,5)-(3,6)
(3,5)-(3,10)
(3,5)-(3,10)
(3,9)-(3,10)
(3,50)-(3,51)
(3,50)-(3,56)
(3,52)-(3,53)
*)
