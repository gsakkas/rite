
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
