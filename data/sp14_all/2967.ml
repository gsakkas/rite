
let rec digitsOfInt n = if n > 10 then (n mod 10) :: (digitsOfInt (n / 10));;


(* fix

let rec digitsOfInt n =
  if n > 10 then (n mod 10) :: (digitsOfInt (n / 10)) else [n];;

*)

(* changed spans
(2,76)-(2,76)
[n]
ListG (fromList [VarG])

*)

(* type error slice
(2,25)-(2,76)
(2,40)-(2,76)
(2,76)-(2,76)
*)
