
let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padLength l1 l2 = abs ((List.length l1) - (List.length l2));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 (padLength l1 l2)) l1), l2)
  else
    if (List.length l1) > (List.length l2)
    then (l1, (List.append (clone 0 (padLength l1 l2)) l2))
    else l1 l2;;


(* fix

let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padLength l1 l2 = abs ((List.length l1) - (List.length l2));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 (padLength l1 l2)) l1), l2)
  else
    if (List.length l1) > (List.length l2)
    then (l1, (List.append (clone 0 (padLength l1 l2)) l2))
    else (l1, l2);;

*)

(* changed spans
(12,10)-(12,15)
(l1 , l2)
TupleG [VarG,VarG]

*)

(* type error slice
(8,9)-(8,53)
(8,10)-(8,21)
(8,50)-(8,52)
(12,10)-(12,12)
(12,10)-(12,15)
*)
