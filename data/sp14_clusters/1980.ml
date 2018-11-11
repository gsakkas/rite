
let rec digitsOfInt n =
  if n < 0 then [] else (digitsOfInt (n / 10)) :: (n mod 10);;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | 0 -> [] | _ -> (digitsOfInt (n / 10)) @ [n mod 10]);;

*)

(* changed spans
(3,24)-(3,46)
n
VarG

(3,24)-(3,46)
(@)
VarG

(3,24)-(3,46)
digitsOfInt (n / 10) @ [n mod 10]
AppG [AppG [EmptyG],ListG EmptyG Nothing]

(3,24)-(3,46)
[]
ListG EmptyG Nothing

(3,24)-(3,60)
match n with
| 0 -> []
| _ -> digitsOfInt (n / 10) @ [n mod 10]
CaseG VarG [(Nothing,ListG EmptyG Nothing),(Nothing,AppG [EmptyG,EmptyG])]

(3,50)-(3,60)
[n mod 10]
ListG (BopG EmptyG EmptyG) Nothing

*)
