
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
(5,29)-(5,65)
(5,41)-(5,42)
*)

(* type error slice
(5,29)-(5,40)
(5,29)-(5,65)
(5,41)-(5,42)
*)
