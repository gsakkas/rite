
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
(9,2)-(9,54)
(9,19)-(9,54)
*)

(* type error slice
(9,2)-(9,54)
(9,19)-(9,30)
(9,19)-(9,54)
*)

(* all spans
(2,14)-(5,20)
(2,16)-(5,20)
(3,2)-(5,20)
(3,22)-(4,59)
(3,24)-(4,59)
(3,26)-(4,59)
(4,4)-(4,59)
(4,7)-(4,12)
(4,7)-(4,8)
(4,11)-(4,12)
(4,18)-(4,21)
(4,27)-(4,59)
(4,27)-(4,38)
(4,39)-(4,40)
(4,41)-(4,48)
(4,42)-(4,43)
(4,46)-(4,47)
(4,49)-(4,59)
(4,50)-(4,51)
(4,55)-(4,58)
(5,2)-(5,20)
(5,2)-(5,13)
(5,14)-(5,15)
(5,16)-(5,17)
(5,18)-(5,20)
(7,12)-(9,54)
(7,15)-(9,54)
(8,2)-(9,54)
(8,13)-(8,48)
(8,13)-(8,29)
(8,14)-(8,25)
(8,26)-(8,28)
(8,32)-(8,48)
(8,33)-(8,44)
(8,45)-(8,47)
(9,2)-(9,54)
(9,5)-(9,13)
(9,5)-(9,9)
(9,12)-(9,13)
(9,19)-(9,54)
(9,19)-(9,30)
(9,31)-(9,51)
(9,32)-(9,37)
(9,38)-(9,39)
(9,40)-(9,50)
(9,41)-(9,44)
(9,45)-(9,49)
(9,52)-(9,54)
*)
