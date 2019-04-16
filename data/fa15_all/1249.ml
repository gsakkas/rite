
let rec clone x n = if n <= 0 then [] else [x] :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) < (List.length l2)
    then clone (0 :: l1) l2
    else clone l1 (0 :: l2);;


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
(9,10)-(9,28)
(0 :: l1 , l2)
TupleG (fromList [VarG,ConAppG (Just EmptyG)])

(10,10)-(10,28)
(l1 , 0 :: l2)
TupleG (fromList [VarG,ConAppG (Just EmptyG)])

*)

(* type error slice
(2,51)-(2,68)
(2,52)-(2,57)
(2,60)-(2,67)
(8,27)-(8,43)
(8,28)-(8,39)
(8,40)-(8,42)
(9,10)-(9,15)
(9,10)-(9,28)
(9,26)-(9,28)
(10,10)-(10,15)
(10,10)-(10,28)
(10,19)-(10,28)
*)
