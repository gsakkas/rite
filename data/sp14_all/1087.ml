
let rec clone x n =
  let rec cloneHelper x n acc =
    if n < 0 then acc else cloneHelper x (n - 1) (x :: acc) in
  cloneHelper x n [];;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then ((List.append ((clone 0 (abs diff)), l1)), l2)
  else if diff > 0 then (l1, (List.append ((clone 0 diff), l2)));;


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
(10,9)-(10,49)
List.append (clone 0
                   (abs diff)) l1
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(11,30)-(11,64)
List.append (clone 0 diff) l2
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(11,65)-(11,65)
(l1 , l2)
TupleG (fromList [VarG])

*)

(* type error slice
(10,9)-(10,49)
(10,10)-(10,21)
(10,22)-(10,48)
(11,8)-(11,65)
(11,25)-(11,65)
(11,30)-(11,64)
(11,31)-(11,42)
(11,43)-(11,63)
(11,65)-(11,65)
*)
