
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
(5,55)-(5,65)
[n mod 10]
ListG [BopG EmptyG EmptyG]

*)

(* type error slice
(5,46)-(5,65)
(5,53)-(5,54)
(5,55)-(5,65)
*)
