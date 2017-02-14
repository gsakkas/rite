
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (clone 0 ((List.length l2) - (List.length l1))) @ l1
  else (clone 0 ((List.length l1) - (List.length l2))) :: l2;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else (((clone 0 ((List.length l1) - (List.length l2))) @ l2), l1);;

*)

(* changed spans
(6,7)-(6,59)
(7,7)-(7,54)
(7,7)-(7,60)
(7,8)-(7,13)
(7,37)-(7,48)
(7,58)-(7,60)
*)

(* type error slice
(5,2)-(7,60)
(5,2)-(7,60)
(6,7)-(6,54)
(6,7)-(6,59)
(6,8)-(6,13)
(6,55)-(6,56)
(7,7)-(7,54)
(7,7)-(7,60)
(7,7)-(7,60)
(7,8)-(7,13)
*)
