
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (clone 0 ((List.length l1) - (List.length l2))) @ l1
  else
    if (List.length l1) < (List.length l2)
    then (clone 0 ((List.length l2) - (List.length l1))) @ (l1 @ [l2])
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
(6,7)-(6,59)
(6,57)-(6,59)
(9,9)-(9,70)
(9,59)-(9,70)
(9,63)-(9,64)
(9,65)-(9,69)
(10,9)-(10,11)
*)

(* type error slice
(2,43)-(2,44)
(2,43)-(2,65)
(2,43)-(2,65)
(2,48)-(2,65)
(2,49)-(2,54)
(2,55)-(2,56)
(6,7)-(6,54)
(6,7)-(6,59)
(6,8)-(6,13)
(6,14)-(6,15)
(6,55)-(6,56)
(6,57)-(6,59)
(9,19)-(9,35)
(9,20)-(9,31)
(9,32)-(9,34)
(9,59)-(9,70)
(9,60)-(9,62)
(9,63)-(9,64)
(9,65)-(9,69)
(9,65)-(9,69)
(9,66)-(9,68)
*)
