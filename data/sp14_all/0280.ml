
let rec digitsOfInt n =
  if n <= 0 then [] else if n > 9 then (n mod 10) :: (digitsOfInt (n / 10));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(3,26)-(3,76)
(n mod 10) :: (digitsOfInt (n / 10))
ConAppG (Just (TupleG (fromList [EmptyG])))

*)

(* type error slice
(3,26)-(3,76)
(3,40)-(3,76)
(3,76)-(3,76)
*)
