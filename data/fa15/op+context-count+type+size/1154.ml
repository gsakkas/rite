
let rec cloneHelper x n l =
  if n <= 0 then l else cloneHelper x (n - 1) (x :: l);;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then ((cloneHelper 0) - (1 * diff)) @ l1
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
(8,10)-(8,21)
(8,10)-(8,23)
(8,10)-(8,36)
(8,10)-(8,43)
(8,22)-(8,23)
(8,28)-(8,29)
(8,28)-(8,36)
(8,32)-(8,36)
(9,8)-(9,50)
(9,11)-(9,15)
(9,11)-(9,19)
(9,18)-(9,19)
(9,26)-(9,37)
(9,26)-(9,44)
(9,46)-(9,47)
*)

(* type error slice
(3,25)-(3,36)
(3,25)-(3,54)
(8,10)-(8,21)
(8,10)-(8,23)
(8,10)-(8,36)
(8,10)-(8,36)
(8,10)-(8,43)
(8,39)-(8,40)
(9,26)-(9,37)
(9,26)-(9,44)
*)
