
let rec digitsOfInt n =
  if n < 0
  then []
  else if (n / 10) > 0 then (digitsOfInt (n / 10)) @ [n mod 10];;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else if n < 10 then [n] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(5,10)-(5,18)
n < 10
BopG VarG LitG

(5,21)-(5,22)
[n]
ListG VarG Nothing

(5,28)-(5,63)
n
VarG

*)
