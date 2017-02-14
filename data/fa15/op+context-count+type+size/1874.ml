
let rec digitsOfInt n =
  if n < 0
  then []
  else
    if n < 10 then [n] else (let d = digitsOfInt (n / 10) in d @ (n mod 10));;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else
    if n < 10 then [n] else (let d = digitsOfInt (n / 10) in d @ [n mod 10]);;

*)

(* changed spans
(6,67)-(6,75)
*)

(* type error slice
(6,62)-(6,75)
(6,64)-(6,65)
(6,67)-(6,75)
*)
