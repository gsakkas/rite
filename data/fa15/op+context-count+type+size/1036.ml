
let rec clone x n = if x <= 0 then [] else List.fold_left n;;


(* fix

let rec cloneHelper x n = if x <= 0 then [] else cloneHelper x (n - 1);;

*)

(* changed spans
(2,43)-(2,57)
(2,43)-(2,59)
(2,58)-(2,59)
*)

(* type error slice
(2,20)-(2,59)
(2,20)-(2,59)
(2,35)-(2,37)
(2,43)-(2,57)
(2,43)-(2,59)
*)
