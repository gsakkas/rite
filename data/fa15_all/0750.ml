
let rec digitsOfInt n =
  match n with | 0 -> [] | x::xs' -> ((digitsOfInt n) / 10) @ [n mod 10];;


(* fix

let rec digitsOfInt n =
  if n > 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(3,2)-(3,72)
if n > 0
then []
else digitsOfInt (n / 10) @ [n mod 10]
IteG (BopG EmptyG EmptyG) (ListG EmptyG Nothing) (AppG (fromList [EmptyG]))

(3,8)-(3,9)
n > 0
BopG VarG LitG

(3,22)-(3,24)
0
LitG

(3,51)-(3,52)
n / 10
BopG VarG LitG

*)
