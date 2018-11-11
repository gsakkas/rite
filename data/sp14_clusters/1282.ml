
let rec digitsOfInt n =
  if n <= 0 then [] else (match n with | n -> [] :: (n mod 10));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (match n with | n -> [] @ [n mod 10]);;

*)

(* changed spans
(3,46)-(3,48)
(@)
VarG

(3,46)-(3,62)
[] @ [n mod 10]
AppG [ListG EmptyG Nothing,ListG EmptyG Nothing]

(3,52)-(3,62)
[n mod 10]
ListG (BopG EmptyG EmptyG) Nothing

*)
