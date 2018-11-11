
let rec clone x n = match n with | 0 -> [] | _ -> [clone x];;


(* fix

let rec clone x n = match n with | 0 -> [] | n -> [x] @ (clone x (n - 1));;

*)

(* changed spans
(2,20)-(2,59)
match n with
| 0 -> []
| n -> [x] @ clone x (n - 1)
CaseG VarG [(Nothing,ListG EmptyG Nothing),(Nothing,AppG [EmptyG,EmptyG])]

(2,50)-(2,59)
(@)
VarG

(2,50)-(2,59)
[x] @ clone x (n - 1)
AppG [ListG EmptyG Nothing,AppG [EmptyG,EmptyG]]

(2,51)-(2,56)
clone x (n - 1)
AppG [VarG,BopG EmptyG EmptyG]

(2,51)-(2,58)
x
VarG

*)
