
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then [(l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))]
  else
    if (List.length l1) < (List.length l2)
    then (clone 0 ((List.length l2) - (List.length l1))) @ (l1 @ l2)
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
(6,8)-(6,70)
(l1 , clone 0
            (List.length l1 - List.length l2) @ l2)
TupleG [VarG,AppG [EmptyG,EmptyG]]

(9,10)-(9,69)
(clone 0
       (List.length l2 - List.length l1) @ l1 , l2)
TupleG [AppG [EmptyG,EmptyG],VarG]

(10,10)-(10,12)
(l1 , l2)
TupleG [VarG,VarG]

*)

(* type error slice
(5,3)-(10,12)
(6,8)-(6,70)
(6,9)-(6,69)
(6,14)-(6,68)
(6,63)-(6,64)
(6,65)-(6,67)
(8,5)-(10,12)
(9,10)-(9,69)
(9,58)-(9,59)
(9,60)-(9,69)
(9,64)-(9,65)
(9,66)-(9,68)
*)
