
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
(6,9)-(6,66)
(6,14)-(6,19)
(6,62)-(6,63)
(7,17)-(7,18)
*)

(* type error slice
(6,9)-(6,57)
(6,9)-(6,66)
(6,62)-(6,63)
*)
