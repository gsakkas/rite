
let rec digitsOfInt n = match n with | n -> 5 | 0 -> [];;


(* fix

let rec digitsOfInt n = match n with | n -> [n];;

*)

(* changed spans
(2,24)-(2,55)
match n with
| n -> [n]
CaseG VarG [(Nothing,ListG EmptyG Nothing)]

(2,53)-(2,55)
[n]
ListG VarG Nothing

*)
