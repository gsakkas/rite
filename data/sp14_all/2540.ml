
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
(6,47)-(6,48)
[y]
ListG [VarG]

*)

(* type error slice
(5,8)-(6,49)
(6,17)-(6,25)
(6,29)-(6,48)
(6,45)-(6,46)
(6,47)-(6,48)
*)
