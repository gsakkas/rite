
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
(6,8)-(6,13)
(6,8)-(6,51)
(8,5)-(10,19)
(9,10)-(9,15)
(9,10)-(9,53)
(9,39)-(9,50)
(10,10)-(10,13)
(10,10)-(10,19)
(10,14)-(10,15)
(10,16)-(10,19)
*)

(* type error slice
(2,44)-(2,64)
(2,50)-(2,55)
(2,50)-(2,64)
(8,5)-(10,19)
(8,5)-(10,19)
(9,10)-(9,15)
(9,10)-(9,53)
(10,10)-(10,19)
(10,14)-(10,15)
*)
