
let rec cloneHelper x n l =
  if n <= 0 then l else cloneHelper x (n - 1) (x :: l);;

let rec clone x n = if n < 1 then [] else cloneHelper x n [];;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then l2 @ (clone 0 (((-1) * diff) - 1))
  else if diff > 0 then clone 0 diff else (l1, l2);;


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
(10,7)-(10,9)
(10,7)-(10,41)
(10,21)-(10,40)
(10,22)-(10,35)
(10,23)-(10,27)
(10,38)-(10,39)
(11,24)-(11,29)
(11,24)-(11,36)
*)

(* type error slice
(10,7)-(10,41)
(10,10)-(10,11)
(10,12)-(10,41)
(10,13)-(10,18)
(11,7)-(11,50)
(11,24)-(11,29)
(11,24)-(11,36)
(11,42)-(11,50)
*)

(* all spans
(2,20)-(3,54)
(2,22)-(3,54)
(2,24)-(3,54)
(3,2)-(3,54)
(3,5)-(3,11)
(3,5)-(3,6)
(3,10)-(3,11)
(3,17)-(3,18)
(3,24)-(3,54)
(3,24)-(3,35)
(3,36)-(3,37)
(3,38)-(3,45)
(3,39)-(3,40)
(3,43)-(3,44)
(3,46)-(3,54)
(3,47)-(3,48)
(3,52)-(3,53)
(5,14)-(5,60)
(5,16)-(5,60)
(5,20)-(5,60)
(5,23)-(5,28)
(5,23)-(5,24)
(5,27)-(5,28)
(5,34)-(5,36)
(5,42)-(5,60)
(5,42)-(5,53)
(5,54)-(5,55)
(5,56)-(5,57)
(5,58)-(5,60)
(7,12)-(11,50)
(7,15)-(11,50)
(8,2)-(11,50)
(8,13)-(8,48)
(8,13)-(8,29)
(8,14)-(8,25)
(8,26)-(8,28)
(8,32)-(8,48)
(8,33)-(8,44)
(8,45)-(8,47)
(9,2)-(11,50)
(9,5)-(9,13)
(9,5)-(9,9)
(9,12)-(9,13)
(10,7)-(10,41)
(10,10)-(10,11)
(10,7)-(10,9)
(10,12)-(10,41)
(10,13)-(10,18)
(10,19)-(10,20)
(10,21)-(10,40)
(10,22)-(10,35)
(10,23)-(10,27)
(10,30)-(10,34)
(10,38)-(10,39)
(11,7)-(11,50)
(11,10)-(11,18)
(11,10)-(11,14)
(11,17)-(11,18)
(11,24)-(11,36)
(11,24)-(11,29)
(11,30)-(11,31)
(11,32)-(11,36)
(11,42)-(11,50)
(11,43)-(11,45)
(11,47)-(11,49)
*)
