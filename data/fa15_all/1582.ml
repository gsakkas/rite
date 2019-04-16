
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((clone 0 ((List.length l2) - (List.length l1))) @ l1) l2
  else
    if (List.length l1) > (List.length l2)
    then l1 ((clone 0 ((List.length l1) - (List.length l2))) @ l2)
    else l1 l2;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else
    if (List.length l1) > (List.length l2)
    then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
    else (l1, l2);;

*)

(* changed spans
(6,8)-(6,65)
(clone 0
       (List.length l2 - List.length l1) @ l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(9,10)-(9,67)
(l1 , clone 0
            (List.length l1 - List.length l2) @ l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(10,10)-(10,15)
(l1 , l2)
TupleG (fromList [VarG])

*)

(* type error slice
(6,8)-(6,62)
(6,8)-(6,65)
(6,38)-(6,54)
(6,39)-(6,50)
(6,51)-(6,53)
(6,57)-(6,58)
(9,10)-(9,12)
(9,10)-(9,67)
(10,10)-(10,12)
(10,10)-(10,15)
*)
