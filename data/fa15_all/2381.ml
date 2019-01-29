
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) :: (n mod 10);;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(3,25)-(3,47)
n
VarG

(3,25)-(3,47)
n mod 10
BopG VarG LitG

(3,25)-(3,47)
10
LitG

*)
