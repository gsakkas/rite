
let rec cloneHelper x n l =
  if n <= 0 then l else cloneHelper x (n - 1) (x :: l);;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then (cloneHelper 0) - (1 * diff)
  else if diff > 0 then (cloneHelper 0 diff) @ l2;;


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
(8,8)-(8,36)
(l1 @ clone 0 diff , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(9,25)-(9,50)
(l1 , l2 @ clone 0 diff)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(9,50)-(9,50)
(l1 , l2)
TupleG (fromList [VarG])

*)

(* type error slice
(3,25)-(3,36)
(3,25)-(3,55)
(7,3)-(9,50)
(8,8)-(8,23)
(8,8)-(8,36)
(8,9)-(8,20)
(9,8)-(9,50)
(9,25)-(9,45)
(9,26)-(9,37)
(9,50)-(9,50)
*)
