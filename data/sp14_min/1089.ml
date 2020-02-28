
let rec clone x n =
  let rec cloneHelper x n acc =
    if n < 0 then acc else cloneHelper x (n - 1) (x :: acc) in
  cloneHelper x n [];;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0 then List.append (clone 0 (abs diff)) l1;;


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
(9,20)-(9,55)
(List.append (clone 0
                    (abs diff)) l1 , l2)
TupleG [AppG [EmptyG,EmptyG],VarG]

(9,55)-(9,55)
if diff > 0
then (l1 , List.append (clone 0
                              diff) l2)
else (l1 , l2)
IteG (BopG EmptyG EmptyG) (TupleG [EmptyG,EmptyG]) (TupleG [EmptyG,EmptyG])

*)

(* type error slice
(9,3)-(9,55)
(9,20)-(9,31)
(9,20)-(9,55)
(9,55)-(9,55)
*)
