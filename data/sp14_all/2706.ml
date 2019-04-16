
let rec digitsOfInt n = if n > 0 then (n / 10) :: (n mod 10) else [];;


(* fix

let rec digitsOfInt n = if n > 0 then [n / 10; n mod 10] else [];;

*)

(* changed spans
(2,39)-(2,61)
[n / 10 ; n mod 10]
ListG (fromList [BopG EmptyG EmptyG])

*)

(* type error slice
(2,39)-(2,61)
(2,51)-(2,61)
*)
