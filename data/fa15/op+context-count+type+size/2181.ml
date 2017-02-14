
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
(8,9)-(8,14)
(8,9)-(8,40)
(9,9)-(9,14)
(9,9)-(9,33)
(9,9)-(9,40)
(9,18)-(9,27)
(9,28)-(9,30)
(9,38)-(9,40)
*)

(* type error slice
(2,35)-(2,55)
(2,41)-(2,46)
(2,41)-(2,55)
(7,7)-(7,18)
(7,7)-(7,21)
(7,19)-(7,21)
(7,26)-(7,37)
(7,26)-(7,40)
(7,38)-(7,40)
(8,9)-(8,14)
(8,9)-(8,33)
(8,9)-(8,40)
(8,9)-(8,40)
(8,38)-(8,40)
(9,9)-(9,14)
(9,9)-(9,33)
(9,9)-(9,40)
(9,9)-(9,40)
(9,38)-(9,40)
*)
