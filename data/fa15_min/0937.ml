
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
(6,8)-(6,63)
(clone 0
       (List.length l2 - List.length l1) @ l1 , l2)
TupleG [AppG [EmptyG,EmptyG],VarG]

(7,8)-(7,61)
(clone 0
       (List.length l1 - List.length l2) @ l2 , l1)
TupleG [AppG [EmptyG,EmptyG],VarG]

*)

(* type error slice
(2,49)-(2,66)
(2,50)-(2,55)
(2,58)-(2,65)
(5,3)-(7,61)
(6,8)-(6,57)
(6,8)-(6,63)
(6,9)-(6,14)
(7,8)-(7,55)
(7,8)-(7,61)
(7,9)-(7,35)
(7,10)-(7,15)
(7,20)-(7,31)
*)
