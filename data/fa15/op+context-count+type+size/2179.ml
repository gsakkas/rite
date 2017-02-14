
let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padLength l1 l2 = abs ((List.length l1) - (List.length l2));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (clone 0 (padLength l1 l2)) * l1
  else (clone 0 (padLength l1 l2)) * l2;;


(* fix

let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padLength l1 l2 = abs ((List.length l1) - (List.length l2));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 (padLength l1 l2)) l1), l2)
  else (l1, (List.append (clone 0 (padLength l1 l2)) l2));;

*)

(* changed spans
(8,7)-(8,39)
(8,8)-(8,13)
(9,7)-(9,34)
(9,7)-(9,39)
(9,8)-(9,13)
(9,17)-(9,26)
(9,27)-(9,29)
(9,37)-(9,39)
*)

(* type error slice
(2,34)-(2,56)
(2,39)-(2,56)
(2,40)-(2,45)
(7,5)-(7,21)
(7,6)-(7,17)
(7,18)-(7,20)
(7,24)-(7,40)
(7,25)-(7,36)
(7,37)-(7,39)
(8,7)-(8,34)
(8,7)-(8,39)
(8,7)-(8,39)
(8,8)-(8,13)
(8,37)-(8,39)
(9,7)-(9,34)
(9,7)-(9,39)
(9,7)-(9,39)
(9,8)-(9,13)
(9,37)-(9,39)
*)
