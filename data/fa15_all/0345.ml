
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
(List.append (clone 0
                    (padLength l1 l2)) l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(8,8)-(8,13)
List.append
VarG

(8,8)-(8,13)
clone 0 (padLength l1 l2)
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(9,7)-(9,34)
l1
VarG

(9,7)-(9,34)
(l1 , List.append (clone 0
                         (padLength l1 l2)) l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(9,7)-(9,39)
l2
VarG

(9,8)-(9,13)
List.append
VarG

(9,8)-(9,13)
clone 0 (padLength l1 l2)
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)
