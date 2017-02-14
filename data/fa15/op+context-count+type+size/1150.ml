
let rec cloneHelper x n l =
  if n <= 0 then l else cloneHelper x (n - 1) (x :: l);;

let rec clone x n = if n < 1 then [] else cloneHelper x n [];;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then (clone 0 abs diff) @ l1
  else if diff > 0 then (clone 0 diff) @ l2;;


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
(10,7)-(10,25)
(10,7)-(10,30)
(10,8)-(10,13)
(10,16)-(10,19)
(10,28)-(10,30)
(11,7)-(11,43)
(11,24)-(11,38)
(11,24)-(11,43)
(11,41)-(11,43)
*)

(* type error slice
(5,3)-(5,62)
(5,14)-(5,60)
(5,16)-(5,60)
(5,23)-(5,24)
(5,23)-(5,28)
(5,23)-(5,28)
(5,27)-(5,28)
(10,7)-(10,25)
(10,8)-(10,13)
(10,16)-(10,19)
(11,7)-(11,43)
(11,7)-(11,43)
(11,7)-(11,43)
(11,24)-(11,43)
(11,39)-(11,40)
*)
