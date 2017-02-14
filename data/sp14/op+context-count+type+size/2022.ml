
let rec reverseInt x y =
  if x != 0 then reverseInt (x / 10) ((y * 10) + (10 mod 10)) else y;;

let rec digitsOfInt n =
  if n < 0
  then []
  else
    (let x = (reverseInt n) / 10
     and y = (reverseInt n) mod 10 in
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
(9,15)-(9,27)
(9,31)-(9,33)
(10,15)-(10,27)
(10,33)-(10,35)
*)

(* type error slice
(3,18)-(3,28)
(3,18)-(3,60)
(9,15)-(9,25)
(9,15)-(9,27)
(9,15)-(9,33)
(10,15)-(10,25)
(10,15)-(10,27)
(10,15)-(10,35)
*)
