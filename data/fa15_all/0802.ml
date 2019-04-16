
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
[n]
ListG (fromList [VarG])

*)

(* type error slice
(3,6)-(3,7)
(3,6)-(3,11)
(3,10)-(3,11)
(6,5)-(6,76)
(6,20)-(6,21)
(6,27)-(6,76)
(6,60)-(6,75)
*)
