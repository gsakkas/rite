
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
(6,9)-(6,60)
(7,9)-(7,14)
(7,9)-(7,52)
(7,9)-(7,61)
(7,38)-(7,49)
(7,59)-(7,61)
*)

(* type error slice
(5,3)-(7,61)
(5,3)-(7,61)
(6,9)-(6,14)
(6,9)-(6,52)
(6,9)-(6,60)
(6,56)-(6,57)
(7,9)-(7,14)
(7,9)-(7,52)
(7,9)-(7,61)
(7,9)-(7,61)
*)
