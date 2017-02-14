
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
