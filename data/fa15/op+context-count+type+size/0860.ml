
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
(5,5)-(5,40)
(6,7)-(6,63)
(6,15)-(6,31)
(6,15)-(6,50)
(6,16)-(6,27)
(6,28)-(6,30)
(6,34)-(6,50)
(6,54)-(6,59)
(6,54)-(6,63)
(6,62)-(6,63)
(8,4)-(10,17)
(8,7)-(8,42)
(9,9)-(9,67)
(9,18)-(9,34)
(9,18)-(9,53)
(9,19)-(9,30)
(9,37)-(9,53)
(9,38)-(9,49)
(9,57)-(9,62)
(9,57)-(9,66)
(9,65)-(9,66)
(10,9)-(10,17)
(10,10)-(10,12)
(10,14)-(10,16)
*)

(* type error slice
(2,43)-(2,65)
(2,48)-(2,65)
(2,49)-(2,54)
(8,4)-(10,17)
(8,4)-(10,17)
(9,9)-(9,67)
(9,57)-(9,62)
(9,57)-(9,66)
(10,9)-(10,17)
*)
