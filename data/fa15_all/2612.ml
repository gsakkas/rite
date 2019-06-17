
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then l1 * ((clone 0 ((List.length l1) - (List.length l2))) @ l2);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

*)

(* changed spans
(6,8)-(6,67)
(l1 , clone 0
            (List.length l1 - List.length l2) @ l2)
TupleG [VarG,AppG [EmptyG,EmptyG]]

(6,67)-(6,67)
(clone 0
       (List.length l2 - List.length l1) @ l1 , l2)
TupleG [AppG [EmptyG,EmptyG],VarG]

*)

(* type error slice
(5,3)-(6,67)
(6,8)-(6,10)
(6,8)-(6,67)
(6,13)-(6,67)
(6,24)-(6,40)
(6,25)-(6,36)
(6,37)-(6,39)
(6,62)-(6,63)
(6,67)-(6,67)
*)
