
let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) + (digitsOfInt (n / 10));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(3,26)-(3,61)
(n mod 10) :: (digitsOfInt (n / 10))
AppG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

*)

(* type error slice
(3,3)-(3,61)
(3,18)-(3,20)
(3,26)-(3,61)
*)
