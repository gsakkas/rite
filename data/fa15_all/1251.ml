
let rec clone x n = if n <= 0 then [] else [x] :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) < (List.length l2)
    then (clone 0 ((List.length l2) - (List.length l1))) :: l1
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
(9,9)-(9,62)
(0 :: l1 , l2)
TupleG (fromList [VarG,ConAppG (Just (TupleG (fromList [VarG,LitG]))) Nothing])

(10,16)-(10,27)
l2
VarG

(10,28)-(10,30)
(l1 , 0 :: l2)
TupleG (fromList [VarG,ConAppG (Just (TupleG (fromList [VarG,LitG]))) Nothing])

*)
