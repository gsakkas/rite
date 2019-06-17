
let rec digitsOfInt n =
  if n < 0 then [] else ([] :: (digitsOfInt (n / 10))) @ (n mod 10);;


(* fix

let rec digitsOfInt n =
  if n < 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(3,25)-(3,55)
digitsOfInt (n / 10)
AppG [BopG EmptyG EmptyG]

(3,58)-(3,68)
[n mod 10]
ListG [BopG EmptyG EmptyG]

*)

(* type error slice
(3,25)-(3,68)
(3,56)-(3,57)
(3,58)-(3,68)
*)
