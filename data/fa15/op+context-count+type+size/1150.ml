
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
(10,9)-(10,14)
(10,9)-(10,25)
(10,9)-(10,31)
(10,17)-(10,20)
(10,29)-(10,31)
(11,8)-(11,44)
(11,26)-(11,38)
(11,26)-(11,44)
(11,42)-(11,44)
*)

(* type error slice
(5,4)-(5,63)
(5,15)-(5,61)
(5,17)-(5,61)
(5,24)-(5,25)
(5,24)-(5,29)
(5,24)-(5,29)
(5,28)-(5,29)
(10,9)-(10,14)
(10,9)-(10,25)
(10,17)-(10,20)
(11,8)-(11,44)
(11,8)-(11,44)
(11,8)-(11,44)
(11,26)-(11,44)
(11,40)-(11,41)
*)
