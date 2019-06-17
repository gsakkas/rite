
let rec cloneHelper x n l =
  if n <= 0 then l else cloneHelper x (n - 1) (x :: l);;

let rec clone x n = if n < 1 then [] else cloneHelper x n [];;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then l2 @ (clone 0 (((-1) * diff) - 1))
  else if diff > 0 then clone 0 diff else (l1, l2);;


(* fix

let rec cloneHelper x n l =
  if n <= 0 then l else cloneHelper x (n - 1) (x :: l);;

let rec clone x n = if n < 1 then [] else cloneHelper x n [];;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then ((l1 @ (clone 0 diff)), l2)
  else if diff > 0 then (l1, (l2 @ (clone 0 diff))) else (l1, l2);;

*)

(* changed spans
(10,8)-(10,42)
(l1 @ clone 0 diff , l2)
TupleG [AppG [EmptyG,EmptyG],VarG]

(11,25)-(11,37)
(l1 , l2 @ clone 0 diff)
TupleG [VarG,AppG [EmptyG,EmptyG]]

*)

(* type error slice
(10,8)-(10,42)
(10,11)-(10,12)
(10,13)-(10,42)
(10,14)-(10,19)
(11,8)-(11,51)
(11,25)-(11,30)
(11,25)-(11,37)
(11,43)-(11,51)
*)
