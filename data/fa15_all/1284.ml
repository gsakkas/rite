
let rec digitsOfInt n =
  if n <= 0 then [] else (match n with | n -> [] @ (n mod 10));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (match n with | n -> [] @ [n mod 10]);;

*)

(* changed spans
(3,51)-(3,61)
[n mod 10]
ListG (BopG EmptyG EmptyG) Nothing

*)
