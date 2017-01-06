
let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | _ -> (digitsOfInt (n / 10)) :: (n mod 10));;



let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | 0 -> [] | _ -> (digitsOfInt (n / 10)) @ [n mod 10]);;


(* changed spans
(5,52)-(5,56)
(5,64)-(5,65)
*)

(* type error slice
(5,30)-(5,64)
*)
