
let rec digitsOfInt n =
  if n < 0 then [] else (digitsOfInt (n / 10)) @ [n & 10];;


(* fix

let rec digitsOfInt n =
  if n < 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(3,52)-(3,53)
n mod 10
BopG VarG LitG

*)
