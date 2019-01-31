
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (clone "0" ((List.length l2) - (List.length l1))) :: l1
  else ((clone "0" List.length l1) - (List.length l2)) :: l2;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else (((clone 0 ((List.length l1) - (List.length l2))) @ l2), l1);;

*)

(* changed spans
(6,7)-(6,62)
(clone 0
       (List.length l2 - List.length l1) @ l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(6,8)-(6,13)
(@)
VarG

(6,8)-(6,13)
clone 0
      (List.length l2 - List.length l1)
AppG (fromList [BopG EmptyG EmptyG,LitG])

(6,14)-(6,17)
0
LitG

(7,8)-(7,34)
l2
VarG

(7,9)-(7,14)
(@)
VarG

(7,9)-(7,14)
clone 0
      (List.length l1 - List.length l2) @ l2
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(7,9)-(7,14)
clone 0
      (List.length l1 - List.length l2)
AppG (fromList [BopG EmptyG EmptyG,LitG])

(7,9)-(7,14)
(clone 0
       (List.length l1 - List.length l2) @ l2 , l1)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(7,15)-(7,18)
0
LitG

(7,19)-(7,30)
List.length l1
AppG (fromList [VarG])

(7,19)-(7,30)
List.length l1 - List.length l2
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

*)
