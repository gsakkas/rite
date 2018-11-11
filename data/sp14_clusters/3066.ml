
let rec digitsOfInt n = match n with | 0 -> [] | n -> [digitsOfInt n];;


(* fix

let rec digitsOfInt n =
  match n with | 0 -> [] | _ -> (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(2,24)-(2,69)
match n with
| 0 -> []
| _ -> digitsOfInt (n / 10) @ [n mod 10]
CaseG VarG [(Nothing,ListG EmptyG Nothing),(Nothing,AppG [EmptyG,EmptyG])]

(2,54)-(2,69)
digitsOfInt (n / 10) @ [n mod 10]
AppG [AppG [EmptyG],ListG EmptyG Nothing]

(2,55)-(2,68)
(@)
VarG

(2,67)-(2,68)
n / 10
BopG VarG LitG

*)
