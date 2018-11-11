
let rec clone x n = match n with | 0 -> [] | _ -> [clone x (n - 1); x];;


(* fix

let rec clone x n = match n with | 0 -> [] | _ -> (clone x (n - 1)) @ [x];;

*)

(* changed spans
(2,51)-(2,56)
(@)
VarG

(2,51)-(2,56)
clone x (n - 1)
AppG [VarG,BopG EmptyG EmptyG]

(2,68)-(2,69)
[x]
ListG VarG Nothing

*)
