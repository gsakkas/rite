
let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | 0 -> [0] | _ -> (digitsOfInt (n / 10)) @ (n mod 10));;



let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | 0 -> [0] | _ -> (digitsOfInt (n / 10)) @ [n mod 10]);;


(* changed spans
(5,65)-(5,66)
(5,74)-(5,75)
*)

(* type error slice
(5,41)-(5,74)
*)
