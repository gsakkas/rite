
let rec clone x n = if n <= 0 then [] else [x] :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) < (List.length l2)
    then clone (0 :: l1) (List.length l2)
    else clone (List.length l1) (0 :: l2);;


(* fix

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) < (List.length l2)
    then ((0 :: l1), l2)
    else (l1, (0 :: l2));;

*)

(* changed spans
(2,14)-(2,67)
(2,16)-(2,67)
(2,20)-(2,67)
(2,23)-(2,24)
(2,23)-(2,29)
(2,28)-(2,29)
(2,35)-(2,37)
(2,43)-(2,46)
(2,43)-(2,67)
(2,44)-(2,45)
(2,50)-(2,67)
(2,51)-(2,56)
(2,57)-(2,58)
(2,59)-(2,66)
(2,60)-(2,61)
(2,64)-(2,65)
(8,26)-(8,42)
(9,9)-(9,41)
(10,9)-(10,41)
*)

(* type error slice
(2,43)-(2,67)
(2,50)-(2,67)
(2,51)-(2,56)
(5,2)-(10,41)
(5,2)-(10,41)
(6,7)-(6,15)
(8,4)-(10,41)
(9,9)-(9,14)
(9,9)-(9,41)
(9,15)-(9,24)
(10,9)-(10,14)
(10,9)-(10,41)
(10,15)-(10,31)
(10,16)-(10,27)
*)
