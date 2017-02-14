
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
(9,4)-(12,61)
(9,13)-(9,23)
(9,13)-(9,25)
(10,5)-(12,60)
(10,13)-(10,14)
(10,13)-(10,19)
(11,13)-(11,14)
(11,19)-(11,21)
*)

(* type error slice
(3,17)-(3,27)
(3,17)-(3,61)
(9,4)-(12,61)
(9,13)-(9,23)
(9,13)-(9,25)
(10,13)-(10,14)
(10,13)-(10,19)
(11,13)-(11,14)
(11,13)-(11,21)
*)
