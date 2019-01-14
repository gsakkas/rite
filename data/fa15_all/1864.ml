
let rec digitsOfInt n = if n <= 0 then [] else (n mod 10) :: digitsOfInt;;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(2,61)-(2,72)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

*)
