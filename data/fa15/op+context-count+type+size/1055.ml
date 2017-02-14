
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
(6,9)-(6,14)
(6,9)-(6,52)
(6,9)-(6,67)
(6,59)-(6,61)
(6,59)-(6,67)
(9,10)-(9,15)
(9,10)-(9,53)
(9,39)-(9,50)
(10,10)-(10,12)
*)

(* type error slice
(5,3)-(10,12)
(5,3)-(10,12)
(6,9)-(6,14)
(6,9)-(6,52)
(6,9)-(6,67)
(6,9)-(6,67)
(8,5)-(10,12)
(9,10)-(9,15)
(9,10)-(9,53)
*)
