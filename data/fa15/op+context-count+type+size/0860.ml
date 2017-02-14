
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then let n = (List.length l2) - (List.length l1) in clone 0 n
  else
    if (List.length l2) < (List.length l1)
    then (let n = (List.length l1) - (List.length l2) in clone 0 n)
    else (l1, l2);;


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
(5,7)-(5,40)
(6,8)-(6,64)
(6,17)-(6,28)
(6,17)-(6,31)
(6,17)-(6,50)
(6,29)-(6,31)
(6,36)-(6,50)
(6,55)-(6,60)
(6,55)-(6,64)
(6,63)-(6,64)
(8,5)-(10,17)
(8,9)-(8,42)
(9,11)-(9,67)
(9,20)-(9,31)
(9,20)-(9,34)
(9,20)-(9,53)
(9,39)-(9,50)
(9,39)-(9,53)
(9,58)-(9,63)
(9,58)-(9,67)
(9,66)-(9,67)
(10,11)-(10,13)
(10,11)-(10,17)
(10,15)-(10,17)
*)

(* type error slice
(2,44)-(2,64)
(2,50)-(2,55)
(2,50)-(2,64)
(8,5)-(10,17)
(8,5)-(10,17)
(9,11)-(9,67)
(9,58)-(9,63)
(9,58)-(9,67)
(10,11)-(10,17)
*)
