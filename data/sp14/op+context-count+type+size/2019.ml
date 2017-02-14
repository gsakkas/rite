
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
*)

(* type error slice
(5,7)-(6,48)
(6,16)-(6,24)
(6,28)-(6,47)
(6,44)-(6,45)
(6,46)-(6,47)
*)
