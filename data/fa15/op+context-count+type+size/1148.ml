
let rec cloneHelper x n l =
  if n <= 0 then l else cloneHelper x (n - 1) (x :: l);;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then (cloneHelper 0 l1) - (1 * diff)
  else if diff > 0 then (cloneHelper 0 diff) @ l2;;


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
(5,13)-(9,50)
(6,3)-(9,50)
(8,9)-(8,20)
(8,9)-(8,25)
(8,9)-(8,38)
(8,21)-(8,22)
(8,23)-(8,25)
(8,30)-(8,31)
(8,30)-(8,38)
(8,34)-(8,38)
(9,8)-(9,50)
(9,11)-(9,15)
(9,11)-(9,19)
(9,18)-(9,19)
(9,26)-(9,37)
(9,26)-(9,44)
*)

(* type error slice
(3,25)-(3,36)
(3,25)-(3,54)
(3,40)-(3,45)
(6,15)-(6,26)
(6,15)-(6,29)
(6,27)-(6,29)
(8,9)-(8,20)
(8,9)-(8,25)
(8,23)-(8,25)
(9,8)-(9,50)
(9,8)-(9,50)
(9,8)-(9,50)
(9,26)-(9,37)
(9,26)-(9,44)
(9,26)-(9,50)
(9,46)-(9,47)
*)
