
let rec cloneHelper x n l =
  if n <= 0 then l else cloneHelper x (n - 1) (x :: l);;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then cloneHelper 0 (((-1) * diff) - 1) l1
  else if diff > 0 then cloneHelper 0 diff l2;;


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
(8,8)-(8,44)
(l1 @ clone 0 diff , l2)
TupleG [AppG [EmptyG,EmptyG],VarG]

(9,25)-(9,46)
(l1 , l2 @ clone 0 diff)
TupleG [VarG,AppG [EmptyG,EmptyG]]

(9,46)-(9,46)
(l1 , l2)
TupleG [VarG,VarG]

*)

(* type error slice
(3,3)-(3,55)
(3,18)-(3,19)
(3,25)-(3,36)
(3,25)-(3,55)
(3,47)-(3,55)
(3,53)-(3,54)
(9,8)-(9,46)
(9,25)-(9,36)
(9,25)-(9,46)
(9,46)-(9,46)
*)
