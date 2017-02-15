
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
(2,43)-(2,46)
(6,7)-(6,65)
(6,13)-(6,18)
(6,61)-(6,62)
(7,16)-(7,17)
*)

(* type error slice
(6,7)-(6,60)
(6,7)-(6,65)
(6,61)-(6,62)
*)
