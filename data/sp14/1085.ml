
let rec clone x n =
  let rec cloneHelper x n acc =
    if n < 0 then acc else cloneHelper x (n - 1) (x :: acc) in
  cloneHelper x n [];;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then List.append ((clone 0 (abs diff)) l1)
  else if diff > 0 then List.append ((clone 0 diff) l2);;


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
(10,8)-(10,45)
(List.append (clone 0
                    (abs diff)) l1 , l2)
TupleG [AppG [EmptyG,EmptyG],VarG]

(11,25)-(11,56)
(l1 , List.append (clone 0
                         diff) l2)
TupleG [VarG,AppG [EmptyG,EmptyG]]

(11,56)-(11,56)
(l1 , l2)
TupleG [VarG,VarG]

*)

(* type error slice
(2,4)-(5,23)
(2,15)-(5,21)
(2,17)-(5,21)
(3,3)-(5,21)
(4,5)-(4,60)
(4,19)-(4,22)
(4,28)-(4,39)
(4,28)-(4,60)
(4,50)-(4,60)
(4,56)-(4,59)
(5,3)-(5,14)
(5,3)-(5,21)
(10,20)-(10,45)
(10,21)-(10,41)
(10,22)-(10,27)
(11,8)-(11,56)
(11,25)-(11,36)
(11,25)-(11,56)
(11,37)-(11,56)
(11,38)-(11,52)
(11,39)-(11,44)
(11,56)-(11,56)
*)
