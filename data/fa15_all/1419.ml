
let rec digitsOfInt n = if n < 0 then [] else n mod 10;;


(* fix

let rec digitsOfInt n = if n < 0 then [] else [n mod 10];;

*)

(* changed spans
(2,46)-(2,54)
[n mod 10]
ListG (BopG EmptyG EmptyG) Nothing

*)
