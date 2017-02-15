
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
(10,7)-(10,18)
(10,7)-(10,44)
(10,19)-(10,44)
(11,7)-(11,55)
(11,24)-(11,35)
(11,24)-(11,55)
(11,36)-(11,55)
*)

(* type error slice
(2,3)-(5,22)
(2,14)-(5,20)
(2,16)-(5,20)
(3,2)-(5,20)
(4,4)-(4,59)
(4,4)-(4,59)
(4,18)-(4,21)
(4,27)-(4,38)
(4,27)-(4,59)
(4,49)-(4,59)
(4,55)-(4,58)
(5,2)-(5,13)
(5,2)-(5,20)
(10,19)-(10,44)
(10,20)-(10,40)
(10,21)-(10,26)
(11,7)-(11,55)
(11,7)-(11,55)
(11,7)-(11,55)
(11,24)-(11,35)
(11,24)-(11,55)
(11,36)-(11,55)
(11,37)-(11,51)
(11,38)-(11,43)
*)
