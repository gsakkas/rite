
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
(10,7)-(10,50)
(10,12)-(10,50)
(10,21)-(10,40)
(10,22)-(10,35)
(10,23)-(10,27)
(10,38)-(10,39)
(10,41)-(10,49)
(10,42)-(10,44)
(11,24)-(11,52)
(11,29)-(11,52)
(11,58)-(11,66)
*)

(* type error slice
(5,3)-(5,62)
(5,14)-(5,60)
(5,16)-(5,60)
(5,20)-(5,60)
(5,34)-(5,36)
(10,12)-(10,50)
(10,13)-(10,18)
(11,7)-(11,66)
(11,7)-(11,66)
(11,24)-(11,52)
(11,27)-(11,28)
(11,29)-(11,52)
(11,30)-(11,35)
(11,58)-(11,66)
*)
