
let rec digitsOfInt n = if n <= 0 then [] else (n mod 10) :: digitsOfInt;;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(2,62)-(2,73)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

*)

(* type error slice
(2,4)-(2,75)
(2,21)-(2,73)
(2,48)-(2,73)
(2,62)-(2,73)
*)
