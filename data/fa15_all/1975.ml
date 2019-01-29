
let rec digitsOfInt n =
  if n < 0 then [] else (match n with | 0 -> [0] | _ -> digitsOfInt n []);;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | 0 -> [] | _ -> (digitsOfInt (n / 10)) @ [n mod 10]);;

*)

(* changed spans
(3,46)-(3,47)
[]
ListG EmptyG Nothing

(3,56)-(3,67)
(@)
VarG

(3,56)-(3,67)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

(3,68)-(3,69)
n / 10
BopG VarG LitG

(3,70)-(3,72)
10
LitG

*)
