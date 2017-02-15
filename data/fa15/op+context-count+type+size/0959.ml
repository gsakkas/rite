
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then l1 @ [(clone 0 ((List.length l1) - (List.length l2))) @ l2]
  else
    if (List.length l1) < (List.length l2)
    then (clone 0 ((List.length l2) - (List.length l1))) @ (l1 @ l2)
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
(6,7)-(6,66)
(6,10)-(6,11)
(6,12)-(6,66)
(9,9)-(9,68)
(9,59)-(9,68)
(9,63)-(9,64)
(10,9)-(10,11)
*)

(* type error slice
(5,2)-(10,11)
(5,2)-(10,11)
(6,7)-(6,9)
(6,7)-(6,66)
(6,10)-(6,11)
(6,12)-(6,66)
(6,12)-(6,66)
(6,13)-(6,65)
(6,61)-(6,62)
(6,63)-(6,65)
(8,4)-(10,11)
(9,9)-(9,68)
(9,57)-(9,58)
(9,59)-(9,68)
(9,60)-(9,62)
(9,63)-(9,64)
(9,65)-(9,67)
*)
