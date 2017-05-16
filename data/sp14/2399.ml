
let rec digitsOfInt n =
  let rec digitsOfIntHelper n result =
    if n > 0
    then (digitsOfIntHelper (n / 10) (n mod 10)) :: result
    else result in
  digitsOfIntHelper n [];;


(* fix

let rec digitsOfInt n =
  let rec digitsOfIntHelper n result =
    if n > 0
    then digitsOfIntHelper (n / 10) ((n mod 10) :: result)
    else result in
  digitsOfIntHelper n [];;

*)

(* changed spans
(5,9)-(5,58)
(5,37)-(5,47)
*)

(* type error slice
(3,2)-(7,24)
(3,28)-(6,15)
(3,30)-(6,15)
(5,9)-(5,48)
(5,9)-(5,58)
(5,10)-(5,27)
(5,37)-(5,47)
(5,52)-(5,58)
(7,2)-(7,19)
(7,2)-(7,24)
(7,22)-(7,24)
*)

(* all spans
(2,20)-(7,24)
(3,2)-(7,24)
(3,28)-(6,15)
(3,30)-(6,15)
(4,4)-(6,15)
(4,7)-(4,12)
(4,7)-(4,8)
(4,11)-(4,12)
(5,9)-(5,58)
(5,9)-(5,48)
(5,10)-(5,27)
(5,28)-(5,36)
(5,29)-(5,30)
(5,33)-(5,35)
(5,37)-(5,47)
(5,38)-(5,39)
(5,44)-(5,46)
(5,52)-(5,58)
(6,9)-(6,15)
(7,2)-(7,24)
(7,2)-(7,19)
(7,20)-(7,21)
(7,22)-(7,24)
*)
