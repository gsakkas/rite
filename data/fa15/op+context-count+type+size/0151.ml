
let rec digitsOfInt n =
  if n < 0 then [] else ([] :: (digitsOfInt (n / 10))) @ (n mod 10);;


(* fix

let rec digitsOfInt n =
  if n < 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(3,24)-(3,54)
(3,25)-(3,27)
(3,57)-(3,67)
*)

(* type error slice
(3,24)-(3,67)
(3,55)-(3,56)
(3,57)-(3,67)
*)
