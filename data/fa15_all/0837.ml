
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
(5,30)-(5,66)
(n' mod 10) :: (digitsOfInt (n / 10))
ConAppG (Just (TupleG (fromList [EmptyG])))

*)

(* type error slice
(5,30)-(5,41)
(5,30)-(5,66)
(5,42)-(5,43)
*)
