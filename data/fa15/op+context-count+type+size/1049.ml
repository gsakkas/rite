
let rec cloneHelper x n l =
  if n <= 0 then l else cloneHelper x (n - 1) (x :: l);;

let rec clone x n = if n < 1 then [] else cloneHelper x n [];;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then clone 0 (((-1) * diff) - 1)
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
(10,7)-(10,12)
(10,7)-(10,34)
(10,15)-(10,34)
(10,16)-(10,29)
(10,17)-(10,21)
(10,32)-(10,33)
(11,24)-(11,29)
(11,24)-(11,36)
(11,43)-(11,45)
(11,47)-(11,49)
*)

(* type error slice
(5,3)-(5,62)
(5,14)-(5,60)
(5,16)-(5,60)
(5,20)-(5,60)
(5,34)-(5,36)
(11,7)-(11,50)
(11,7)-(11,50)
(11,24)-(11,29)
(11,24)-(11,36)
(11,42)-(11,50)
*)
