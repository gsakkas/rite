
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((clone 0 ((List.length l2) - (List.length l1))) @ l1) l2
  else
    if (List.length l1) > (List.length l2)
    then l1 ((clone 0 ((List.length l1) - (List.length l2))) @ l2)
    else l1 l2;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else
    if (List.length l1) > (List.length l2)
    then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
    else (l1, l2);;

*)

(* changed spans
(6,7)-(6,64)
(9,9)-(9,66)
(10,9)-(10,14)
*)

(* type error slice
(6,7)-(6,61)
(6,7)-(6,64)
(6,37)-(6,53)
(6,38)-(6,49)
(6,50)-(6,52)
(6,56)-(6,57)
(9,9)-(9,11)
(9,9)-(9,66)
(10,9)-(10,11)
(10,9)-(10,14)
*)
