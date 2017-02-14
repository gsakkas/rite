
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
(10,8)-(10,19)
(10,8)-(10,44)
(10,22)-(10,44)
(11,8)-(11,55)
(11,25)-(11,36)
(11,25)-(11,55)
(11,39)-(11,55)
*)

(* type error slice
(2,4)-(5,23)
(2,15)-(5,21)
(2,17)-(5,21)
(3,3)-(5,21)
(4,5)-(4,59)
(4,5)-(4,59)
(4,19)-(4,22)
(4,28)-(4,39)
(4,28)-(4,59)
(4,51)-(4,59)
(4,56)-(4,59)
(5,3)-(5,14)
(5,3)-(5,21)
(10,22)-(10,27)
(10,22)-(10,39)
(10,22)-(10,44)
(11,8)-(11,55)
(11,8)-(11,55)
(11,8)-(11,55)
(11,25)-(11,36)
(11,25)-(11,55)
(11,39)-(11,44)
(11,39)-(11,51)
(11,39)-(11,55)
*)
