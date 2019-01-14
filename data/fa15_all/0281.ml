
let rec cloneHelper x n l =
  if n <= 0 then l else cloneHelper x (n - 1) (x :: l);;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then (cloneHelper 0 ((-1) * diff)) @ l1
  else if diff > 0 then (cloneHelper 0 diff) @ l2;;


(* fix

let rec cloneHelper x n l =
  if n <= 0 then l else cloneHelper x (n - 1) (x :: l);;

let rec clone x n = if n < 1 then [] else cloneHelper x n [];;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff < 0
  then ((l1 @ (clone 0 diff)), l2)
  else if diff > 0 then (l1, (l2 @ (clone 0 diff))) else (l1, l2);;

*)

(* changed spans
(5,12)-(9,49)
n
VarG

(5,12)-(9,49)
cloneHelper
VarG

(5,12)-(9,49)
x
VarG

(5,12)-(9,49)
n
VarG

(5,12)-(9,49)
fun x ->
  fun n ->
    if n < 1
    then []
    else cloneHelper x n []
LamG (LamG EmptyG)

(5,12)-(9,49)
fun n ->
  if n < 1
  then []
  else cloneHelper x n []
LamG (IteG EmptyG EmptyG EmptyG)

(5,12)-(9,49)
cloneHelper x n []
AppG (fromList [VarG,ListG EmptyG Nothing])

(5,12)-(9,49)
n < 1
BopG VarG LitG

(5,12)-(9,49)
1
LitG

(5,12)-(9,49)
if n < 1
then []
else cloneHelper x n []
IteG (BopG EmptyG EmptyG) (ListG EmptyG Nothing) (AppG (fromList [EmptyG]))

(5,12)-(9,49)
[]
ListG EmptyG Nothing

(5,12)-(9,49)
[]
ListG EmptyG Nothing

(8,7)-(8,36)
l1
VarG

(8,7)-(8,41)
(l1 @ clone 0 diff , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(8,8)-(8,19)
clone
VarG

(8,39)-(8,41)
l2
VarG

(9,24)-(9,44)
l2
VarG

(9,24)-(9,49)
l1
VarG

(9,24)-(9,49)
(l1 , l2 @ clone 0 diff)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(9,25)-(9,36)
clone
VarG

(9,47)-(9,49)
l1
VarG

(9,47)-(9,49)
(l1 , l2)
TupleG (fromList [VarG])

*)
