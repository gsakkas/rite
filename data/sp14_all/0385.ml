
let rec digitsOfInt n = ((digitsOfInt n) / 10) @ [n mod 10];;


(* fix

let rec digitsOfInt n = (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(2,25)-(2,60)
(n mod 10) :: (digitsOfInt (n / 10))
ConAppG (Just (TupleG (fromList [EmptyG])))

*)

(* type error slice
(2,25)-(2,47)
(2,25)-(2,60)
(2,48)-(2,49)
*)
