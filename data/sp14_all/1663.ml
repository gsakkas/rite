
let rec digitsOfInt n = if n < 0 then [] else (match n with | f::b -> f);;


(* fix

let rec digitsOfInt n = if n < 0 then [] else (n mod 10) :: (digitsOfInt n);;

*)

(* changed spans
(2,47)-(2,73)
(n mod 10) :: (digitsOfInt n)
AppG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

*)

(* type error slice
(2,28)-(2,29)
(2,28)-(2,33)
(2,32)-(2,33)
(2,47)-(2,73)
(2,54)-(2,55)
*)
