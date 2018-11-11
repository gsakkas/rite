
let rec reverseInt x y =
  if x != 0 then reverseInt (x / 10) ((y * 10) + (10 mod 10)) else y;;

let rec digitsOfInt n =
  if n < 0
  then []
  else
    (let m = reverseInt n in
     let x = m / 10
     and y = m mod 10 in
     if (x = 0) && (y = 0) then [] else y :: (digitsOfInt x));;


(* fix

let rec reverseInt x y =
  if x != 0 then reverseInt (x / 10) ((y * 10) + (10 mod 10)) else y;;

let rec digitsOfInt n =
  if n < 0
  then []
  else
    (let x = (reverseInt n 0) / 10
     and y = (reverseInt n 0) mod 10 in
     if (x = 0) && (y = 0) then [] else y :: (digitsOfInt x));;

*)

(* changed spans
(10,13)-(10,14)
reverseInt n 0
AppG [VarG,LitG]

(10,17)-(10,19)
reverseInt
VarG

(10,17)-(10,19)
n
VarG

(10,17)-(10,19)
0
LitG

(11,13)-(11,14)
reverseInt n 0
AppG [VarG,LitG]

(11,19)-(11,21)
reverseInt
VarG

(11,19)-(11,21)
n
VarG

(11,19)-(11,21)
0
LitG

*)
