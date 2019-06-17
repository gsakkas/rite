
let rec clone x n =
  let rec cloneHelper x n acc =
    if n < 0 then acc else cloneHelper x (n - 1) (x :: acc) in
  cloneHelper x n [];;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then List.append (clone 0 (abs diff)) l1
  else if diff > 0 then List.append (clone 0 diff) l2;;


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
(10,8)-(10,43)
(List.append (clone 0
                    (abs diff)) l1 , l2)
TupleG [AppG [EmptyG,EmptyG],VarG]

(11,25)-(11,54)
(l1 , List.append (clone 0
                         diff) l2)
TupleG [VarG,AppG [EmptyG,EmptyG]]

(11,54)-(11,54)
(l1 , l2)
TupleG [VarG,VarG]

*)

(* type error slice
(11,8)-(11,54)
(11,25)-(11,36)
(11,25)-(11,54)
(11,54)-(11,54)
*)
