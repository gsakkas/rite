
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
(6,10)-(6,65)
(9,10)-(9,66)
(10,10)-(10,15)
*)

(* type error slice
(6,10)-(6,61)
(6,10)-(6,65)
(6,39)-(6,50)
(6,39)-(6,53)
(6,51)-(6,53)
(6,57)-(6,58)
(9,10)-(9,12)
(9,10)-(9,66)
(10,10)-(10,12)
(10,10)-(10,15)
*)
