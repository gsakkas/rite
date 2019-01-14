
let rec digitsOfInt n =
  if n < 0 then [] else (n mod 10) :: [] :: ((digitsOfInt n) / 10);;


(* fix

let rec digitsOfInt n = if n < 0 then [] else [n mod 10];;

*)

(* changed spans
(3,24)-(3,66)
[n mod 10]
ListG (BopG EmptyG EmptyG) Nothing

*)
