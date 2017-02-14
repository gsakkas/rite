
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
(10,8)-(10,13)
(10,8)-(10,34)
(10,19)-(10,21)
(10,19)-(10,29)
(10,19)-(10,34)
(10,33)-(10,34)
(11,25)-(11,30)
(11,25)-(11,37)
(11,44)-(11,46)
(11,48)-(11,50)
*)

(* type error slice
(5,4)-(5,63)
(5,15)-(5,61)
(5,17)-(5,61)
(5,21)-(5,61)
(5,35)-(5,37)
(11,8)-(11,50)
(11,8)-(11,50)
(11,25)-(11,30)
(11,25)-(11,37)
(11,44)-(11,50)
*)
