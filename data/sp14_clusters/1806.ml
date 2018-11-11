
let rec digitsOfInt n =
  if n <= 0 then [] else [digitsOfInt (n / 10); n mod 10];;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(3,25)-(3,57)
digitsOfInt (n / 10) @ [n mod 10]
AppG [AppG [EmptyG],ListG EmptyG Nothing]

(3,26)-(3,46)
(@)
VarG

(3,48)-(3,56)
[n mod 10]
ListG (BopG EmptyG EmptyG) Nothing

*)
