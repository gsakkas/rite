
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (clone 0 ((List.length l1) - (List.length l2))) :: l1 :: l2
  else
    if (List.length l1) < (List.length l2)
    then clone 0 ((List.length l2) - (List.length l1))
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
(6,7)-(6,54)
(6,7)-(6,66)
(6,8)-(6,13)
(6,58)-(6,60)
(6,58)-(6,66)
(9,9)-(9,14)
(9,9)-(9,54)
(9,38)-(9,49)
(10,9)-(10,11)
*)

(* type error slice
(5,2)-(10,11)
(5,2)-(10,11)
(6,7)-(6,54)
(6,7)-(6,66)
(6,7)-(6,66)
(6,8)-(6,13)
(8,4)-(10,11)
(9,9)-(9,14)
(9,9)-(9,54)
*)
