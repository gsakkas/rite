
let rec clone x n =
  let rec cloneHelper x n acc =
    if n < 0 then acc else cloneHelper x (n - 1) (x :: acc) in
  cloneHelper x n [];;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then List.append ((clone 0 (abs diff)), l1)
  else if diff > 0 then List.append ((clone 0 diff), l2);;


(* fix

let rec clone x n =
  let rec cloneHelper x n acc =
    if n < 0 then acc else cloneHelper x (n - 1) (x :: acc) in
  cloneHelper x n [];;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then ((List.append (clone 0 (abs diff)) l1), l2)
  else if diff > 0 then (l1, (List.append (clone 0 diff) l2)) else (l1, l2);;

*)

(* changed spans
(10,8)-(10,46)
(List.append (clone 0
                    (abs diff)) l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(11,25)-(11,57)
(l1 , List.append (clone 0
                         diff) l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(11,57)-(11,57)
(l1 , l2)
TupleG (fromList [VarG])

*)

(* type error slice
(10,8)-(10,19)
(10,8)-(10,46)
(10,20)-(10,46)
(11,25)-(11,36)
(11,25)-(11,57)
(11,37)-(11,57)
*)
