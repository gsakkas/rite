
let rec clone x n = if x <= 0 then [] else List.fold_left n;;


(* fix

let rec cloneHelper x n = if x <= 0 then [] else cloneHelper x (n - 1);;

let rec clone x n = cloneHelper x n;;

*)

(* changed spans
(2,21)-(2,60)
cloneHelper x n
AppG (fromList [VarG])

*)

(* type error slice
(2,21)-(2,60)
(2,36)-(2,38)
(2,44)-(2,58)
(2,44)-(2,60)
*)
