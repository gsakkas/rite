
let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padLength l1 l2 = abs ((List.length l1) - (List.length l2));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (clone 0 (padLength l1 l2)) :: l1
  else (clone 0 (padLength l1 l2)) l2;;


(* fix

let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padLength l1 l2 = abs ((List.length l1) - (List.length l2));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 (padLength l1 l2)) l1), l2)
  else (l1, (List.append (clone 0 (padLength l1 l2)) l2));;

*)

(* changed spans
(8,8)-(8,41)
(List.append (clone 0
                    (padLength l1 l2)) l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(9,8)-(9,38)
(l1 , List.append (clone 0
                         (padLength l1 l2)) l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* type error slice
(2,35)-(2,57)
(2,40)-(2,57)
(2,41)-(2,46)
(9,8)-(9,35)
(9,8)-(9,38)
(9,9)-(9,14)
*)
