
let rec digitsOfInt n =
  if n < 0
  then []
  else
    if n < 10 then n else (let d = digitsOfInt (n / 10) in (n mod 10) :: d);;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else
    if n < 10 then [n] else (let d = digitsOfInt (n / 10) in (n mod 10) :: d);;

*)

(* changed spans
(6,19)-(6,20)
(6,26)-(6,75)
*)

(* type error slice
(3,2)-(6,75)
(3,2)-(6,75)
(3,5)-(3,6)
(3,5)-(3,10)
(3,5)-(3,10)
(3,9)-(3,10)
(4,7)-(4,9)
(6,4)-(6,75)
(6,4)-(6,75)
(6,19)-(6,20)
(6,26)-(6,75)
(6,59)-(6,74)
*)
