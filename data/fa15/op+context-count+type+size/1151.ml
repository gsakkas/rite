
let rec cloneHelper x n l =
  if n <= 0 then l else cloneHelper x (n - 1) (x :: l);;

let rec clone x n = if n < 1 then [] else cloneHelper x n [];;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then l1 @ (clone 0 (((-1) * diff) - 1) (l1, l2))
  else if diff > 0 then l2 @ (clone 0 diff (l1, l2)) else (l1, l2);;


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
(10,8)-(10,49)
(10,14)-(10,49)
(10,25)-(10,27)
(10,25)-(10,35)
(10,25)-(10,40)
(10,39)-(10,40)
(10,43)-(10,45)
(10,43)-(10,49)
(11,25)-(11,51)
(11,31)-(11,51)
(11,60)-(11,66)
*)

(* type error slice
(5,4)-(5,63)
(5,15)-(5,61)
(5,17)-(5,61)
(5,21)-(5,61)
(5,35)-(5,37)
(10,14)-(10,19)
(10,14)-(10,49)
(11,8)-(11,66)
(11,8)-(11,66)
(11,25)-(11,51)
(11,28)-(11,29)
(11,31)-(11,36)
(11,31)-(11,51)
(11,60)-(11,66)
*)
