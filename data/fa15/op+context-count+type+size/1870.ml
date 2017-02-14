
let rec digitsOfInt n =
  if n < 0
  then []
  else
    if n < 10 then [n] else (let d = digitsOfInt (n / 10) in d :: (n mod 10));;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else
    if n < 10
    then [n]
    else (let d::[] = digitsOfInt (n / 10) in [d; n mod 10]);;

*)

(* changed spans
(6,28)-(6,77)
(6,61)-(6,76)
*)

(* type error slice
(2,3)-(6,79)
(2,20)-(6,77)
(3,2)-(6,77)
(6,4)-(6,77)
(6,28)-(6,77)
(6,28)-(6,77)
(6,37)-(6,48)
(6,37)-(6,57)
(6,61)-(6,62)
(6,61)-(6,76)
(6,61)-(6,76)
(6,61)-(6,76)
(6,66)-(6,76)
*)
