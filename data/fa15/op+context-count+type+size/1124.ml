
let rec digitsOfInt n =
  if n <= 0
  then []
  else (match n with | n' -> (n' mod 10) @ (digitsOfInt (n / 10)));;


(* fix

let rec digitsOfInt n =
  if n <= 0
  then []
  else (match n with | n' -> (n' mod 10) :: (digitsOfInt (n / 10)));;

*)

(* changed spans
(5,31)-(5,64)
(5,42)-(5,43)
*)

(* type error slice
(5,31)-(5,40)
(5,31)-(5,64)
(5,42)-(5,43)
*)
