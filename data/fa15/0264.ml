
let rec clone x n = if x <= 0 then [] else List.fold_left x;;


(* fix

let rec cloneHelper x n = if x <= 0 then [] else cloneHelper x (n - 1);;

let rec clone x n = cloneHelper x n;;

*)

(* changed spans
(2,43)-(2,57)
(2,43)-(2,59)
(2,58)-(2,59)
*)

(* type error slice
(2,23)-(2,24)
(2,23)-(2,29)
(2,28)-(2,29)
(2,43)-(2,57)
(2,43)-(2,59)
(2,58)-(2,59)
*)

(* all spans
(2,14)-(2,59)
(2,16)-(2,59)
(2,20)-(2,59)
(2,23)-(2,29)
(2,23)-(2,24)
(2,28)-(2,29)
(2,35)-(2,37)
(2,43)-(2,59)
(2,43)-(2,57)
(2,58)-(2,59)
*)
