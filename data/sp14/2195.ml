
let rec digitsOfInt n =
  if n <= 0
  then []
  else (let digits = digitsOfInt (n / 10) in digits @ (n mod 10));;


(* fix

let rec digitsOfInt n =
  if n <= 0
  then []
  else (let digits = digitsOfInt (n / 10) in digits @ [n mod 10]);;

*)

(* changed spans
(5,54)-(5,64)
*)

(* type error slice
(5,45)-(5,64)
(5,52)-(5,53)
(5,54)-(5,64)
*)

(* all spans
(2,20)-(5,65)
(3,2)-(5,65)
(3,5)-(3,11)
(3,5)-(3,6)
(3,10)-(3,11)
(4,7)-(4,9)
(5,7)-(5,65)
(5,21)-(5,41)
(5,21)-(5,32)
(5,33)-(5,41)
(5,34)-(5,35)
(5,38)-(5,40)
(5,45)-(5,64)
(5,52)-(5,53)
(5,45)-(5,51)
(5,54)-(5,64)
(5,55)-(5,56)
(5,61)-(5,63)
*)
