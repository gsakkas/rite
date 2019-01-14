
let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let n = (List.length l1) - (List.length l2) in
  if n > 0 then (clone 0 n) @ l2 else ((clone 0) - n) @ l1;;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let n = (List.length l1) - (List.length l2) in
  if n > 0 then (l1, ((clone 0 n) @ l2)) else (((clone 0 (0 - n)) @ l1), l2);;

*)

(* changed spans
(6,16)-(6,32)
l1
VarG

(6,16)-(6,32)
(l1 , clone 0 n @ l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(6,38)-(6,58)
(clone 0 (0 - n) @ l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(6,39)-(6,48)
clone 0 (0 - n)
AppG (fromList [BopG EmptyG EmptyG,LitG])

(6,51)-(6,52)
0 - n
BopG LitG VarG

(6,51)-(6,52)
0
LitG

*)
