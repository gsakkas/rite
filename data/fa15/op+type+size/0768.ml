
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
(9,18)-(9,53)
(9,57)-(9,62)
(9,57)-(9,66)
(9,63)-(9,64)
(9,65)-(9,66)
(10,9)-(10,17)
(10,10)-(10,12)
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

(* all spans
(2,14)-(2,65)
(2,16)-(2,65)
(2,20)-(2,65)
(2,23)-(2,29)
(2,23)-(2,24)
(2,28)-(2,29)
(2,35)-(2,37)
(2,43)-(2,65)
(2,43)-(2,44)
(2,48)-(2,65)
(2,49)-(2,54)
(2,55)-(2,56)
(2,57)-(2,64)
(2,58)-(2,59)
(2,62)-(2,63)
(4,12)-(10,17)
(4,15)-(10,17)
(5,2)-(10,17)
(5,5)-(5,40)
(5,5)-(5,21)
(5,6)-(5,17)
(5,18)-(5,20)
(5,24)-(5,40)
(5,25)-(5,36)
(5,37)-(5,39)
(6,7)-(6,63)
(6,15)-(6,50)
(6,15)-(6,31)
(6,16)-(6,27)
(6,28)-(6,30)
(6,34)-(6,50)
(6,35)-(6,46)
(6,47)-(6,49)
(6,54)-(6,63)
(6,54)-(6,59)
(6,60)-(6,61)
(6,62)-(6,63)
(8,4)-(10,17)
(8,7)-(8,42)
(8,7)-(8,23)
(8,8)-(8,19)
(8,20)-(8,22)
(8,26)-(8,42)
(8,27)-(8,38)
(8,39)-(8,41)
(9,9)-(9,67)
(9,18)-(9,53)
(9,18)-(9,34)
(9,19)-(9,30)
(9,31)-(9,33)
(9,37)-(9,53)
(9,38)-(9,49)
(9,50)-(9,52)
(9,57)-(9,66)
(9,57)-(9,62)
(9,63)-(9,64)
(9,65)-(9,66)
(10,9)-(10,17)
(10,10)-(10,12)
(10,14)-(10,16)
*)
