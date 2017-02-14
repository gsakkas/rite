
let rec cloneHelper x n l =
  if n <= 0 then l else cloneHelper x (n - 1) (x :: l);;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then cloneHelper 0 (((-1) * diff) - 1) l1
  else if diff > 0 then cloneHelper 0 diff l2 else l1 l2;;


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
(5,12)-(9,56)
(6,2)-(9,56)
(8,7)-(8,18)
(8,7)-(8,43)
(8,19)-(8,20)
(8,21)-(8,40)
(8,22)-(8,35)
(8,23)-(8,27)
(8,30)-(8,34)
(8,38)-(8,39)
(8,41)-(8,43)
(9,7)-(9,56)
(9,10)-(9,14)
(9,10)-(9,18)
(9,17)-(9,18)
(9,24)-(9,35)
(9,24)-(9,45)
(9,36)-(9,37)
(9,51)-(9,53)
(9,51)-(9,56)
(9,54)-(9,56)
*)

(* type error slice
(6,13)-(6,29)
(6,14)-(6,25)
(6,26)-(6,28)
(9,51)-(9,53)
(9,51)-(9,56)
*)
