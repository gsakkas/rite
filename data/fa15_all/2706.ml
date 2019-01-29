
let rec digitsOfInt n = if n > 0 then (n / 10) :: (n mod 10) else [];;


(* fix

let rec digitsOfInt n = if n > 0 then [n / 10; n mod 10] else [];;

*)

(* changed spans
(2,38)-(2,60)
[n / 10 ; n mod 10]
ListG (BopG EmptyG EmptyG) Nothing

*)
