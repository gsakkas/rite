
let rec digitsOfInt n =
  if n < 0
  then []
  else (let x = n / 10
        and y = n mod 10 in (digitsOfInt x) @ y);;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else (let x = n / 10
        and y = n mod 10 in (digitsOfInt x) @ [y]);;

*)

(* changed spans
(6,46)-(6,47)
[y]
ListG VarG Nothing

*)
