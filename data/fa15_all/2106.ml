
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then let n = (List.length l2) - (List.length l1) in clone 0 n
  else
    if (List.length l2) < (List.length l1)
    then (let n = (List.length l1) - (List.length l2) in clone 0 n)
    else (l1, l2);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

*)

(* changed spans
(5,6)-(5,41)
List.length l1 = List.length l2
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(6,8)-(6,64)
(l1 , l2)
TupleG (fromList [VarG])

(8,21)-(8,23)
l1
VarG

(8,40)-(8,42)
l2
VarG

(9,10)-(9,68)
(clone 0
       (List.length l2 - List.length l1) @ l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(10,15)-(10,17)
clone 0
      (List.length l1 - List.length l2) @ l2
AppG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* type error slice
(2,44)-(2,66)
(2,49)-(2,66)
(2,50)-(2,55)
(8,5)-(10,18)
(9,10)-(9,68)
(9,58)-(9,63)
(9,58)-(9,67)
(10,10)-(10,18)
*)
