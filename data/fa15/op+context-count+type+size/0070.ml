
let rec clone x n = if n <= 0 then [] else [x] :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) :: l1), l2)
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
(2,15)-(2,66)
(2,17)-(2,66)
(2,21)-(2,66)
(2,24)-(2,25)
(2,24)-(2,30)
(2,29)-(2,30)
(2,36)-(2,38)
(2,44)-(2,47)
(2,44)-(2,66)
(2,45)-(2,46)
(2,52)-(2,57)
(2,52)-(2,66)
(2,58)-(2,59)
(2,61)-(2,62)
(2,61)-(2,66)
(2,65)-(2,66)
(8,28)-(8,42)
(9,13)-(9,70)
(10,10)-(10,41)
*)

(* type error slice
(2,52)-(2,57)
(2,52)-(2,66)
(2,61)-(2,66)
(10,10)-(10,15)
(10,10)-(10,41)
(10,34)-(10,41)
*)
