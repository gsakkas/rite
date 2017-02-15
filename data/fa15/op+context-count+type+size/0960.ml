
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then clone 0 ((List.length l1) - (List.length l2))
  else
    if (List.length l1) < (List.length l2)
    then clone 0 ((List.length l2) - (List.length l1))
    else "(" ^ ")";;


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
(6,7)-(6,12)
(6,7)-(6,52)
(8,4)-(10,18)
(9,9)-(9,14)
(9,9)-(9,54)
(9,38)-(9,49)
(10,9)-(10,12)
(10,9)-(10,18)
(10,13)-(10,14)
(10,15)-(10,18)
*)

(* type error slice
(2,43)-(2,65)
(2,48)-(2,65)
(2,49)-(2,54)
(8,4)-(10,18)
(8,4)-(10,18)
(9,9)-(9,14)
(9,9)-(9,54)
(10,9)-(10,18)
(10,13)-(10,14)
*)
