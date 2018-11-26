
let rec digitsOfInt n =
  if n < 0
  then []
  else if n < 10 then n else (digitsOfInt (n / 10)) @ [n mod 10];;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else if n < 10 then [n] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(5,22)-(5,23)
[n]
ListG VarG Nothing

*)
