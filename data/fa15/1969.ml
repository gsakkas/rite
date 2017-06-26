
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
(10,9)-(10,11)
*)

(* type error slice
(5,2)-(10,11)
(6,7)-(6,54)
(6,7)-(6,66)
(6,8)-(6,13)
(8,4)-(10,11)
(9,9)-(9,14)
(9,9)-(9,54)
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
(4,12)-(10,11)
(4,15)-(10,11)
(5,2)-(10,11)
(5,5)-(5,40)
(5,5)-(5,21)
(5,6)-(5,17)
(5,18)-(5,20)
(5,24)-(5,40)
(5,25)-(5,36)
(5,37)-(5,39)
(6,7)-(6,66)
(6,7)-(6,54)
(6,8)-(6,13)
(6,14)-(6,15)
(6,16)-(6,53)
(6,17)-(6,33)
(6,18)-(6,29)
(6,30)-(6,32)
(6,36)-(6,52)
(6,37)-(6,48)
(6,49)-(6,51)
(6,58)-(6,66)
(6,58)-(6,60)
(6,64)-(6,66)
(8,4)-(10,11)
(8,7)-(8,42)
(8,7)-(8,23)
(8,8)-(8,19)
(8,20)-(8,22)
(8,26)-(8,42)
(8,27)-(8,38)
(8,39)-(8,41)
(9,9)-(9,54)
(9,9)-(9,14)
(9,15)-(9,16)
(9,17)-(9,54)
(9,18)-(9,34)
(9,19)-(9,30)
(9,31)-(9,33)
(9,37)-(9,53)
(9,38)-(9,49)
(9,50)-(9,52)
(10,9)-(10,11)
*)
