
let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let n = (List.length l1) - (List.length l2) in
  if n > 0 then (clone 0 n) @ l2 else ((clone 0) - n) @ l1;;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let n = (List.length l1) - (List.length l2) in
  if n > 0 then (l1, ((clone 0 n) @ l2)) else (((clone 0 (0 - n)) @ l1), l2);;

*)

(* changed spans
(6,17)-(6,33)
(l1 , clone 0 n @ l2)
TupleG [VarG,AppG [EmptyG,EmptyG]]

(6,39)-(6,59)
(clone 0 (0 - n) @ l1 , l2)
TupleG [AppG [EmptyG,EmptyG],VarG]

*)

(* type error slice
(6,17)-(6,28)
(6,18)-(6,23)
(6,39)-(6,54)
(6,39)-(6,59)
(6,40)-(6,49)
(6,41)-(6,46)
(6,55)-(6,56)
*)
