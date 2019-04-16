
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
[]
ListG (fromList [])

*)

(* type error slice
(6,5)-(9,51)
(7,10)-(7,11)
(8,10)-(9,51)
(9,29)-(9,50)
(9,45)-(9,46)
*)
