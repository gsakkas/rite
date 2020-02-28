
let rec digitsOfInt n =
  if n < 0 then [] else (digitsOfInt (n / 10)) @ (n mod 10);;


(* fix

let rec digitsOfInt n =
  if n < 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(3,50)-(3,60)
[n mod 10]
ListG [BopG EmptyG EmptyG]

*)

(* type error slice
(3,25)-(3,60)
(3,48)-(3,49)
(3,50)-(3,60)
*)
