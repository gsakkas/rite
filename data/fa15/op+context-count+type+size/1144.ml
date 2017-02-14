
let rec cloneHelper x n l =
  if n <= 0 then l else cloneHelper x (n - 1) (x :: l);;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then cloneHelper 0 (((-1) * diff) - 1) l1
  else if diff > 0 then cloneHelper 0 diff l2;;


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
(5,13)-(9,46)
(6,3)-(9,46)
(8,8)-(8,19)
(8,8)-(8,44)
(8,20)-(8,21)
(8,25)-(8,27)
(8,25)-(8,35)
(8,25)-(8,40)
(8,31)-(8,35)
(8,39)-(8,40)
(8,42)-(8,44)
(9,8)-(9,46)
(9,11)-(9,15)
(9,11)-(9,19)
(9,18)-(9,19)
(9,25)-(9,36)
(9,25)-(9,46)
(9,37)-(9,38)
*)

(* type error slice
(3,3)-(3,54)
(3,3)-(3,54)
(3,18)-(3,19)
(3,25)-(3,36)
(3,25)-(3,54)
(3,48)-(3,54)
(3,53)-(3,54)
(9,8)-(9,46)
(9,8)-(9,46)
(9,8)-(9,46)
(9,25)-(9,36)
(9,25)-(9,46)
*)
