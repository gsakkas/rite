
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else (l1, (clone 0 (((List.length l1) - (List.length l2)) @ l2)));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

*)

(* changed spans
(10,16)-(10,21)
(10,27)-(10,67)
(10,63)-(10,64)
*)

(* type error slice
(5,26)-(5,37)
(5,26)-(5,40)
(5,38)-(5,40)
(10,27)-(10,60)
(10,27)-(10,67)
(10,63)-(10,64)
(10,65)-(10,67)
*)
