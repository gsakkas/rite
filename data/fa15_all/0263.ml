
let rec clone x n = if x <= 0 then [] else List.fold_left n;;


(* fix

let rec cloneHelper x n = if x <= 0 then [] else cloneHelper x (n - 1);;

let rec clone x n = cloneHelper x n;;

*)

(* changed spans
(2,43)-(2,57)
cloneHelper x (n - 1)
AppG (fromList [VarG,BopG EmptyG EmptyG])

(2,58)-(2,59)
cloneHelper
VarG

(2,58)-(2,59)
x
VarG

(2,58)-(2,59)
n - 1
BopG VarG LitG

*)
