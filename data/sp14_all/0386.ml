
let rec digitsOfInt n = (n mod 10) :: ((digitsOfInt n) / 10);;


(* fix

let rec digitsOfInt n = (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(2,39)-(2,61)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

*)

(* type error slice
(2,4)-(2,63)
(2,21)-(2,61)
(2,25)-(2,61)
(2,39)-(2,61)
(2,40)-(2,55)
(2,41)-(2,52)
*)
