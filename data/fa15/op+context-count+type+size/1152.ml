
let rec cloneHelper x n l =
  if n <= 0 then l else cloneHelper x (n - 1) (x :: l);;

let rec clone x n = if n < 1 then [] else cloneHelper x n [];;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then l1 @ (clone 0 (((-1) * diff) - 1))
  else if diff > 0 then l2 @ (clone 0 (diff - 1)) else (l1, l2);;


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
(10,7)-(10,41)
(10,21)-(10,40)
(10,22)-(10,35)
(10,23)-(10,27)
(10,38)-(10,39)
(11,24)-(11,49)
(11,38)-(11,48)
(11,46)-(11,47)
*)

(* type error slice
(11,7)-(11,63)
(11,7)-(11,63)
(11,24)-(11,49)
(11,27)-(11,28)
(11,55)-(11,63)
*)
