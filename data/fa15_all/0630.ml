
let rec clone x n = [clone x (n - 1); x];;


(* fix

let rec clone x n = (clone x (n - 1)) @ [x];;

*)

(* changed spans
(2,21)-(2,26)
(@)
VarG

(2,21)-(2,26)
clone x (n - 1)
AppG (fromList [VarG,BopG EmptyG EmptyG])

(2,38)-(2,39)
[x]
ListG VarG Nothing

*)
