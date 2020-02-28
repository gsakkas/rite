
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
(6,29)-(6,78)
let d :: [] =
  digitsOfInt (n / 10) in
[d ; n mod 10]
LetG NonRec [(ConsPatG EmptyPatG EmptyPatG,AppG [EmptyG])] (ListG [EmptyG,EmptyG])

*)

(* type error slice
(2,4)-(6,80)
(2,21)-(6,78)
(3,3)-(6,78)
(6,5)-(6,78)
(6,29)-(6,78)
(6,38)-(6,49)
(6,38)-(6,58)
(6,62)-(6,63)
(6,62)-(6,77)
(6,67)-(6,77)
*)
