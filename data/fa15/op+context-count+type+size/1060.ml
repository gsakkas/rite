
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (clone 0 ((List.length l1) - (List.length l2))) @ l1
  else
    if (List.length l1) < (List.length l2)
    then [(clone 0 ((List.length l2) - (List.length l1))) @ l1] @ [l2]
    else [];;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else (l1, l2);;

*)

(* changed spans
(6,9)-(6,60)
(6,58)-(6,60)
(9,10)-(9,64)
(9,10)-(9,71)
(9,65)-(9,66)
(9,67)-(9,71)
(10,10)-(10,12)
*)

(* type error slice
(5,3)-(10,12)
(5,3)-(10,12)
(6,9)-(6,14)
(6,9)-(6,52)
(6,9)-(6,60)
(6,56)-(6,57)
(8,5)-(10,12)
(9,10)-(9,64)
(9,10)-(9,64)
(9,10)-(9,71)
(9,12)-(9,17)
(9,12)-(9,55)
(9,12)-(9,63)
(9,59)-(9,60)
(9,65)-(9,66)
*)
