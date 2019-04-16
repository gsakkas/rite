
let rec digitsOfInt n =
  if n < 0
  then []
  else
    if n < 10 then [n] else (let d = digitsOfInt (n / 10) in [d; n mod 10]);;


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
(6,29)-(6,76)
let d :: [] =
  digitsOfInt (n / 10) in
[d ; n mod 10]
LetG NonRec (fromList [(ConsPatG VarPatG (ConPatG Nothing),AppG (fromList [EmptyG]))]) (ListG (fromList [EmptyG]))

*)

(* type error slice
(2,4)-(6,78)
(2,21)-(6,76)
(3,3)-(6,76)
(6,5)-(6,76)
(6,29)-(6,76)
(6,38)-(6,49)
(6,38)-(6,58)
(6,62)-(6,75)
(6,63)-(6,64)
*)
