
let rec clone x n = failwith "to be implemented";;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;


(* fix

let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2))
  else ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2);;

*)

(* changed spans
(2,29)-(2,48)
if n > 0
then x :: (clone x (n - 1))
else []
IteG (BopG EmptyG EmptyG) (ConAppG (Just EmptyG) Nothing) (ListG EmptyG Nothing)

(4,12)-(6,77)
n
VarG

(4,12)-(6,77)
x
VarG

(4,12)-(6,77)
clone
VarG

(4,12)-(6,77)
x
VarG

(4,12)-(6,77)
n
VarG

(4,12)-(6,77)
clone x (n - 1)
AppG (fromList [VarG,BopG EmptyG EmptyG])

(4,12)-(6,77)
n > 0
BopG VarG LitG

(4,12)-(6,77)
n - 1
BopG VarG LitG

(4,12)-(6,77)
0
LitG

(4,12)-(6,77)
1
LitG

(4,12)-(6,77)
x :: (clone x (n - 1))
ConAppG (Just (TupleG (fromList [VarG,AppG (fromList [VarG,BopG VarG LitG])]))) Nothing

(4,12)-(6,77)
[]
ListG EmptyG Nothing

(5,2)-(6,77)
(List.append (clone 0
                    (List.length l2 - List.length l1))
             l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

*)
