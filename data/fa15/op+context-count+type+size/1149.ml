
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
(11,43)-(11,45)
(11,47)-(11,49)
*)

(* type error slice
(10,7)-(10,41)
(10,10)-(10,11)
(10,12)-(10,41)
(10,13)-(10,18)
(11,7)-(11,50)
(11,7)-(11,50)
(11,24)-(11,29)
(11,24)-(11,36)
(11,42)-(11,50)
*)
