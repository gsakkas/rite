
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (clone 0 ((List.length l2) - (List.length l1))) :: l1
  else (clone "0" ((List.length l1) - (List.length l2))) :: l2;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else (((clone 0 ((List.length l1) - (List.length l2))) @ l2), l1);;

*)

(* changed spans
(6,7)-(6,60)
(6,8)-(6,13)
(7,7)-(7,56)
(7,7)-(7,62)
(7,8)-(7,13)
(7,14)-(7,17)
(7,39)-(7,50)
(7,60)-(7,62)
*)

(* type error slice
(6,7)-(6,54)
(6,8)-(6,13)
(6,14)-(6,15)
(7,7)-(7,56)
(7,8)-(7,13)
(7,14)-(7,17)
*)
