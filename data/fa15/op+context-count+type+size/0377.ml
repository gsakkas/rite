
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
(6,8)-(6,13)
(6,14)-(6,17)
(7,7)-(7,54)
(7,7)-(7,60)
(7,8)-(7,34)
(7,9)-(7,14)
(7,15)-(7,18)
(7,19)-(7,30)
(7,38)-(7,49)
(7,58)-(7,60)
*)

(* type error slice
(2,48)-(2,65)
(2,49)-(2,54)
(2,57)-(2,64)
(5,2)-(7,60)
(5,2)-(7,60)
(6,7)-(6,56)
(6,7)-(6,62)
(6,7)-(6,62)
(6,8)-(6,13)
(7,7)-(7,54)
(7,7)-(7,60)
(7,7)-(7,60)
(7,8)-(7,34)
(7,9)-(7,14)
(7,19)-(7,30)
*)
