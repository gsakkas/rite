
let rec cloneHelper x n l =
  if n <= 0 then l else cloneHelper x (n - 1) (x :: l);;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then cloneHelper 0 (((-1) * diff) - 1) l1
  else if diff > 0 then cloneHelper 0 diff l2 else l1 l2;;


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
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(9,25)-(9,46)
(l1 , l2 @ clone 0 diff)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(9,52)-(9,57)
(l1 , l2)
TupleG (fromList [VarG])

*)

(* type error slice
(6,14)-(6,30)
(6,15)-(6,26)
(6,27)-(6,29)
(9,52)-(9,54)
(9,52)-(9,57)
*)
