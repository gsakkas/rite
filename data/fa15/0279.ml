
let rec cloneHelper x n l =
  if n <= 0 then l else cloneHelper x (n - 1) (x :: l);;

let rec clone x n = if n < 1 then [] else cloneHelper x n [];;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then (clone 0 abs diff) @ l1
  else if diff > 0 then (clone 0 diff) @ l2;;


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
(10,8)-(10,31)
(l1 @ clone 0 diff , l2)
TupleG [AppG [EmptyG,EmptyG],VarG]

(11,25)-(11,44)
(l1 , l2 @ clone 0 diff)
TupleG [VarG,AppG [EmptyG,EmptyG]]

(11,44)-(11,44)
(l1 , l2)
TupleG [VarG,VarG]

*)

(* type error slice
(5,4)-(5,63)
(5,15)-(5,61)
(5,17)-(5,61)
(5,24)-(5,25)
(5,24)-(5,29)
(5,28)-(5,29)
(10,8)-(10,26)
(10,9)-(10,14)
(10,17)-(10,20)
(11,8)-(11,44)
(11,25)-(11,44)
(11,40)-(11,41)
(11,44)-(11,44)
*)
