
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((clone "0" List.length l2) - (List.length l1)) :: l1
  else ((clone "0" List.length l1) - (List.length l2)) :: l2;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else (((clone 0 ((List.length l1) - (List.length l2))) @ l2), l1);;

*)

(* changed spans
(6,7)-(6,54)
(6,7)-(6,60)
(6,8)-(6,34)
(6,9)-(6,14)
(6,15)-(6,18)
(6,19)-(6,30)
(7,7)-(7,54)
(7,7)-(7,60)
(7,8)-(7,34)
(7,9)-(7,14)
(7,15)-(7,18)
(7,19)-(7,30)
(7,31)-(7,33)
(7,37)-(7,53)
(7,38)-(7,49)
(7,50)-(7,52)
*)

(* type error slice
(2,48)-(2,65)
(2,49)-(2,54)
(2,57)-(2,64)
(6,8)-(6,34)
(6,9)-(6,14)
(6,19)-(6,30)
(7,8)-(7,34)
(7,9)-(7,14)
(7,19)-(7,30)
*)
