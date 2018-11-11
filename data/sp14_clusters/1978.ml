
let rec digitsOfInt n = if n < 0 then [] else [digitsOfInt (n / 10)];;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | 0 -> [] | _ -> (digitsOfInt (n / 10)) @ [n mod 10]);;

*)

(* changed spans
(2,46)-(2,68)
match n with
| 0 -> []
| _ -> digitsOfInt (n / 10) @ [n mod 10]
CaseG VarG [(Nothing,ListG EmptyG Nothing),(Nothing,AppG [EmptyG,EmptyG])]

(2,47)-(2,67)
n
VarG

(2,47)-(2,67)
(@)
VarG

(2,47)-(2,67)
digitsOfInt (n / 10) @ [n mod 10]
AppG [AppG [EmptyG],ListG EmptyG Nothing]

(2,47)-(2,67)
[]
ListG EmptyG Nothing

*)
