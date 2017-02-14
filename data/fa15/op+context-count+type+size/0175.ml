
let rec digitsOfInt n =
  if n < 0 then [] else ([] :: (digitsOfInt (n / 10))) @ (n mod 10);;


(* fix

let rec digitsOfInt n =
  if n < 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(3,26)-(3,28)
(3,26)-(3,52)
(3,59)-(3,67)
*)

(* type error slice
(3,26)-(3,67)
(3,56)-(3,57)
(3,59)-(3,67)
*)
