
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
(11,24)-(11,35)
(11,24)-(11,55)
(11,36)-(11,55)
(11,37)-(11,51)
(11,38)-(11,43)
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
(7,12)-(11,55)
(7,15)-(11,55)
(8,2)-(11,55)
(8,13)-(8,48)
(8,13)-(8,29)
(8,14)-(8,25)
(8,26)-(8,28)
(8,32)-(8,48)
(8,33)-(8,44)
(8,45)-(8,47)
(9,2)-(11,55)
(9,5)-(9,13)
(9,5)-(9,9)
(9,12)-(9,13)
(10,7)-(10,44)
(10,7)-(10,18)
(10,19)-(10,44)
(10,20)-(10,40)
(10,21)-(10,26)
(10,27)-(10,28)
(10,29)-(10,39)
(10,30)-(10,33)
(10,34)-(10,38)
(10,41)-(10,43)
(11,7)-(11,55)
(11,10)-(11,18)
(11,10)-(11,14)
(11,17)-(11,18)
(11,24)-(11,55)
(11,24)-(11,35)
(11,36)-(11,55)
(11,37)-(11,51)
(11,38)-(11,43)
(11,44)-(11,45)
(11,46)-(11,50)
(11,52)-(11,54)
*)
