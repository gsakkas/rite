
let rec cloneHelper x n l =
  if n <= 0 then l else cloneHelper x (n - 1) (x :: l);;

let rec clone x n = if n < 1 then [] else cloneHelper x n [];;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then l1 @ (clone 0 (((-1) * diff) - 1))
  else if diff > 0 then l2 @ ((clone 0 diff) - 1) else (l1, l2);;


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

(11,25)-(11,50)
(l1 , l2 @ clone 0 diff)
TupleG [VarG,AppG [EmptyG,EmptyG]]

*)

(* type error slice
(5,4)-(5,63)
(5,15)-(5,61)
(5,17)-(5,61)
(5,21)-(5,61)
(5,35)-(5,37)
(9,3)-(11,64)
(10,8)-(10,42)
(10,11)-(10,12)
(11,8)-(11,64)
(11,25)-(11,50)
(11,28)-(11,29)
(11,30)-(11,50)
(11,31)-(11,45)
(11,32)-(11,37)
(11,56)-(11,64)
*)
