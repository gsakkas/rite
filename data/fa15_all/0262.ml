
let rec clone x n = x List.map x n;;


(* fix

let rec cloneHelper x n = if x <= 0 then [] else cloneHelper x (n - 1);;

let rec clone x n = cloneHelper x n;;

*)

(* changed spans
(2,21)-(2,35)
cloneHelper x n
AppG (fromList [VarG])

*)

(* type error slice
(2,21)-(2,22)
(2,21)-(2,35)
(2,32)-(2,33)
*)
