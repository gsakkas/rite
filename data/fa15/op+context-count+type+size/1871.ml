
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
(6,20)-(6,21)
(6,28)-(6,75)
*)

(* type error slice
(3,3)-(6,75)
(3,3)-(6,75)
(3,6)-(3,7)
(3,6)-(3,11)
(3,6)-(3,11)
(3,10)-(3,11)
(4,8)-(4,10)
(6,5)-(6,75)
(6,5)-(6,75)
(6,20)-(6,21)
(6,28)-(6,75)
(6,61)-(6,75)
*)
