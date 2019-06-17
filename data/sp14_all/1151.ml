
let rec digitsOfInt n =
  if n < 0
  then []
  else if n < 10 then [n] else [digitsOfInt (n / 10); n mod 10];;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else
    if n = 0
    then [0]
    else
      if n > 10
      then digitsOfInt (n mod 10)
      else (let a = n mod 10 in let b = n / 10 in if b = 0 then [n] else [a]);;

*)

(* changed spans
(5,11)-(5,17)
n = 0
BopG VarG LitG

(5,24)-(5,25)
0
LitG

(5,32)-(5,64)
if n > 10
then digitsOfInt (n mod 10)
else (let a = n mod 10 in
      let b = n / 10 in
      if b = 0 then [n] else [a])
IteG (BopG EmptyG EmptyG) (AppG [EmptyG]) (LetG NonRec [(EmptyPatG,EmptyG)] EmptyG)

*)

(* type error slice
(2,4)-(5,66)
(2,21)-(5,64)
(3,3)-(5,64)
(5,8)-(5,64)
(5,32)-(5,64)
(5,33)-(5,44)
(5,33)-(5,53)
*)
