
let rec clone x n = if n <= 0 then [] else [x] :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (clone 0 ((List.length l1) - (List.length l2)))) @ l2
  else (((clone 9 ((List.length l2) - (List.length l1))) @ l1), l2);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

*)

(* changed spans
(2,44)-(2,47)
x
VarG

(6,8)-(6,66)
(l1 , clone 0
            (List.length l1 - List.length l2) @ l2)
TupleG [VarG,AppG [EmptyG,EmptyG]]

(7,17)-(7,18)
0
LitG

*)

(* type error slice
(6,8)-(6,61)
(6,8)-(6,66)
(6,62)-(6,63)
*)
