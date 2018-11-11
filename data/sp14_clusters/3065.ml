
let rec digitsOfInt n = match n with | 0 -> [] | n -> [(digitsOfInt n) / 10];;


(* fix

let rec digitsOfInt n =
  match n with | 0 -> [] | _ -> (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(2,24)-(2,76)
match n with
| 0 -> []
| _ -> digitsOfInt (n / 10) @ [n mod 10]
CaseG VarG [(Nothing,ListG EmptyG Nothing),(Nothing,AppG [EmptyG,EmptyG])]

(2,55)-(2,70)
(@)
VarG

(2,55)-(2,75)
digitsOfInt (n / 10) @ [n mod 10]
AppG [AppG [EmptyG],ListG EmptyG Nothing]

(2,68)-(2,69)
n / 10
BopG VarG LitG

*)
