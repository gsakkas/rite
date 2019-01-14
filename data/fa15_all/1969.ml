
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (clone 0 ((List.length l1) - (List.length l2))) :: l1 :: l2
  else
    if (List.length l1) < (List.length l2)
    then clone 0 ((List.length l2) - (List.length l1))
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
(6,7)-(6,54)
l1
VarG

(6,7)-(6,66)
(l1 , clone 0
            (List.length l1 - List.length l2) @ l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(6,8)-(6,13)
(@)
VarG

(6,8)-(6,13)
clone 0
      (List.length l1 - List.length l2)
AppG (fromList [BopG EmptyG EmptyG,LitG])

(9,9)-(9,14)
(@)
VarG

(9,9)-(9,14)
clone 0
      (List.length l2 - List.length l1)
AppG (fromList [BopG EmptyG EmptyG,LitG])

(9,9)-(9,54)
(clone 0
       (List.length l2 - List.length l1) @ l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(10,9)-(10,11)
l1
VarG

*)
