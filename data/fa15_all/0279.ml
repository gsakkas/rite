
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
(10,7)-(10,25)
l1
VarG

(10,7)-(10,30)
(l1 @ clone 0 diff , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(10,8)-(10,13)
clone 0 diff
AppG (fromList [VarG,LitG])

(10,28)-(10,30)
l2
VarG

(11,24)-(11,38)
l2
VarG

(11,24)-(11,43)
l1
VarG

(11,24)-(11,43)
(l1 , l2 @ clone 0 diff)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(11,41)-(11,43)
l1
VarG

(11,41)-(11,43)
(l1 , l2)
TupleG (fromList [VarG])

*)
