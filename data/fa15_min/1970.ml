
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (clone 0 ((List.length l1) - (List.length l2))) @ l1
  else
    if (List.length l1) < (List.length l2)
    then (clone 0 ((List.length l2) - (List.length l1))) @ (l1 @ [l2])
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
(6,8)-(6,60)
(l1 , clone 0
            (List.length l1 - List.length l2) @ l2)
TupleG [VarG,AppG [EmptyG,EmptyG]]

(9,10)-(9,71)
(clone 0
       (List.length l2 - List.length l1) @ l1 , l2)
TupleG [AppG [EmptyG,EmptyG],VarG]

(10,10)-(10,12)
(l1 , l2)
TupleG [VarG,VarG]

*)

(* type error slice
(2,44)-(2,45)
(2,44)-(2,66)
(2,49)-(2,66)
(2,50)-(2,55)
(2,56)-(2,57)
(6,8)-(6,55)
(6,8)-(6,60)
(6,9)-(6,14)
(6,15)-(6,16)
(6,56)-(6,57)
(6,58)-(6,60)
(9,20)-(9,36)
(9,21)-(9,32)
(9,33)-(9,35)
(9,60)-(9,71)
(9,61)-(9,63)
(9,64)-(9,65)
(9,66)-(9,70)
(9,67)-(9,69)
*)
