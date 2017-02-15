
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
(5,12)-(9,45)
(6,2)-(9,45)
(8,7)-(8,18)
(8,7)-(8,43)
(8,19)-(8,20)
(8,21)-(8,40)
(8,22)-(8,35)
(8,23)-(8,27)
(8,30)-(8,34)
(8,38)-(8,39)
(8,41)-(8,43)
(9,7)-(9,45)
(9,10)-(9,14)
(9,10)-(9,18)
(9,17)-(9,18)
(9,24)-(9,35)
(9,24)-(9,45)
(9,36)-(9,37)
*)

(* type error slice
(3,2)-(3,54)
(3,2)-(3,54)
(3,17)-(3,18)
(3,24)-(3,35)
(3,24)-(3,54)
(3,46)-(3,54)
(3,52)-(3,53)
(9,7)-(9,45)
(9,7)-(9,45)
(9,7)-(9,45)
(9,24)-(9,35)
(9,24)-(9,45)
*)
