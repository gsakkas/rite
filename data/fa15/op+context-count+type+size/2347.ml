
let rec digitsOfInt n =
  if n < 0
  then []
  else
    if n = 0
    then 0
    else (let x = n mod 10
          and r = n / 10 in (digitsOfInt r) @ [x]);;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else
    if n = 0
    then []
    else (let x = n mod 10
          and r = n / 10 in (digitsOfInt r) @ [x]);;

*)

(* changed spans
(7,10)-(7,11)
*)

(* type error slice
(3,3)-(9,50)
(3,3)-(9,50)
(4,8)-(4,10)
(6,5)-(9,50)
(6,5)-(9,50)
(7,10)-(7,11)
(8,11)-(9,50)
(9,30)-(9,50)
(9,45)-(9,46)
*)
