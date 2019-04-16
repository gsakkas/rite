
let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let n = (List.length l1) - (List.length l2) in
  if n > 0 then (clone 0 n) @ l2 else ((clone 0) - (1 * n)) @ l1;;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let n = (List.length l1) - (List.length l2) in
  if n > 0 then (l1, ((clone 0 n) @ l2)) else (((clone 0 (0 - n)) @ l1), l2);;

*)

(* changed spans
(6,17)-(6,33)
(l1 , clone 0 n @ l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(6,39)-(6,65)
(clone 0 (0 - n) @ l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* type error slice
(6,17)-(6,28)
(6,18)-(6,23)
(6,39)-(6,60)
(6,39)-(6,65)
(6,40)-(6,49)
(6,41)-(6,46)
(6,61)-(6,62)
*)
