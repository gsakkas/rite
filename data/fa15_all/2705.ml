
let rec digitsOfInt n =
  if n > 0 then ((digitsOfInt n) / 10) :: (n mod 10) else [];;


(* fix

let rec digitsOfInt n = if n > 0 then [n / 10; n mod 10] else [];;

*)

(* changed spans
(3,16)-(3,52)
[n / 10 ; n mod 10]
ListG (BopG EmptyG EmptyG) Nothing

*)
